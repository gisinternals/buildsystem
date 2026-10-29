[CmdletBinding()]
param(
    [string]$Root,
    [string]$OutputJson,
    [string]$OutputMarkdown
)

Set-StrictMode -Version 2.0
$ErrorActionPreference = 'Stop'
$projectRoot = Split-Path $PSScriptRoot -Parent
if (-not $Root) { $Root = $projectRoot }
if (-not $OutputJson) { $OutputJson = Join-Path $projectRoot 'doc\phase1-baseline.json' }
if (-not $OutputMarkdown) { $OutputMarkdown = Join-Path $projectRoot 'doc\phase1-baseline.md' }

function Resolve-CommandPath([string]$Name) {
    $command = Get-Command $Name -ErrorAction SilentlyContinue
    if ($command) { return $command.Source }
    return $null
}

function Read-Assignments([string]$Path) {
    $items = @()
    $lineNumber = 0
    foreach ($line in Get-Content -LiteralPath $Path) {
        $lineNumber++
        if ($line -match '^\s*(?:set\s+)?([A-Za-z][A-Za-z0-9_-]*(?:VER|VERSION|BRANCH|REL|_tag)[A-Za-z0-9_-]*)\s*=\s*(.*?)\s*$') {
            $items += [pscustomobject]@{ name=$matches[1]; value=$matches[2]; file=(Split-Path $Path -Leaf); line=$lineNumber }
        }
    }
    return $items
}

$vsCandidates = @(
    'C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars32.bat',
    'C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars64.bat',
    'C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars32.bat',
    'C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars64.bat'
)
$tools = @('git','7z','nmake','cl','nuget','dotnet','powershell') | ForEach-Object {
    [pscustomobject]@{ name=$_; path=(Resolve-CommandPath $_) }
}
$outputs = Get-ChildItem -LiteralPath $Root -Directory -Filter 'release-*' -ErrorAction SilentlyContinue | ForEach-Object {
    $files = Get-ChildItem -LiteralPath $_.FullName -File -Recurse -ErrorAction SilentlyContinue
    [pscustomobject]@{ path=$_.FullName; fileCount=@($files).Count; bytes=(@($files | Measure-Object Length -Sum).Sum) }
}
$artifacts = Get-ChildItem -LiteralPath $Root -File -Recurse -ErrorAction SilentlyContinue |
    Where-Object { $_.Extension -in @('.zip','.msi','.exe','.nupkg') -and ($_.FullName -match '\\release-[^\\]*\\' -or $_.FullName -match '\\nuget\\[^\\]+\.nupkg$') } |
    ForEach-Object { [pscustomobject]@{ path=$_.FullName.Substring($Root.Length + 1); bytes=$_.Length; modified=$_.LastWriteTime.ToString('o') } }
$assignments = @()
foreach ($file in @('config.opt','setversions.bat','Makefile','makepackage-cmake.bat')) {
    $path = Join-Path $Root $file
    if (Test-Path -LiteralPath $path) { $assignments += Read-Assignments $path }
}
$duplicates = $assignments | Group-Object name | Where-Object Count -gt 1 | ForEach-Object {
    [pscustomobject]@{ name=$_.Name; definitions=@($_.Group) }
}
$publishCalls = Select-String -Path (Join-Path $Root 'Makefile') -Pattern 'uploadftp|signdir|nuget push' | ForEach-Object {
    [pscustomobject]@{ file=$_.Filename; line=$_.LineNumber; text=$_.Line.Trim() }
}

$baseline = [ordered]@{
    capturedAt = (Get-Date).ToString('o')
    root = $Root
    gitHead = (& git -C $Root rev-parse HEAD).Trim()
    gitStatus = @(& git -C $Root status --short)
    tools = @($tools)
    visualStudioScripts = @($vsCandidates | ForEach-Object { [pscustomobject]@{ path=$_; exists=(Test-Path -LiteralPath $_) } })
    outputDirectories = @($outputs)
    artifacts = @($artifacts)
    duplicateVersionDefinitions = @($duplicates)
    publishingCommands = @($publishCalls)
    buildExecution = [ordered]@{
        status = 'not-run'
        reason = 'No release-* baseline exists, NuGet is not on PATH, and package targets contain live signing/FTP publication commands. Add staging/no-publish controls before executing the scheduled pipeline as validation.'
    }
}
$baseline | ConvertTo-Json -Depth 8 | Set-Content -LiteralPath $OutputJson -Encoding UTF8

$md = New-Object System.Collections.Generic.List[string]
$md.Add('# Phase 1 baseline')
$md.Add('')
$md.Add('Captured: ' + (Get-Date).ToString('yyyy-MM-dd HH:mm:ss K'))
$md.Add('')
$md.Add('Git commit: `' + $baseline.gitHead + '`')
$md.Add('')
$md.Add('## Build readiness')
$md.Add('')
$md.Add('| Check | Result |')
$md.Add('|---|---|')
foreach ($tool in $tools) { $md.Add('| Tool `' + $tool.name + '` | ' + $(if ($tool.path) { '`' + $tool.path + '`' } else { 'not on PATH' }) + ' |') }
foreach ($script in $baseline.visualStudioScripts) { $md.Add('| `' + $script.path + '` | ' + $(if ($script.exists) { 'present' } else { 'missing' }) + ' |') }
$md.Add('| Existing `release-*` output directories | ' + @($outputs).Count + ' |')
$md.Add('| Existing package artifacts | ' + @($artifacts).Count + ' |')
$md.Add('')
$md.Add('The four scheduled builds and NuGet baseline were not executed: ' + $baseline.buildExecution.reason)
$md.Add('')
$md.Add('## Version ownership findings')
$md.Add('')
$md.Add('The machine-readable report records every repeated version-like assignment. The principal ownership decisions are:')
$md.Add('')
$md.Add('- `setversions.bat` owns GDAL, MapServer, and MapCache stable/release selections used by compiler entry points.')
$md.Add('- `config.opt` owns third-party dependency source pins and fallback application branches.')
$md.Add('- Makefile values should be defaults only. `SWIG_VER` currently has a Makefile default while `makepackage-cmake.bat` repeats it on commands; Phase 2 should centralize this pin.')
$md.Add('- NuGet uses `gdal-release-ver` derived by `setversions.bat`; nuspec binary paths separately encode compiler output directories and require review when toolsets change.')
$md.Add('')
$md.Add('## Publication safeguard finding')
$md.Add('')
$md.Add('The existing `package`, `package-libs`, `package-dev`, and related targets call signing and FTP upload commands directly. Baseline validation needs a `NO_SIGN`/`NO_PUBLISH` or staging equivalent before those targets can be safely exercised outside the production scheduled task.')
$md.Add('')
$md.Add('See `phase1-baseline.json` for tool paths, all discovered artifacts, duplicate definitions, and exact publication call sites.')
$md | Set-Content -LiteralPath $OutputMarkdown -Encoding UTF8

Write-Host "Wrote $OutputJson"
Write-Host "Wrote $OutputMarkdown"
