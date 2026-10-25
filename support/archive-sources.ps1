[CmdletBinding()]
param(
    [string]$BaseDir,
    [string]$OutputDir,
    [string]$Manifest,
    [switch]$ValidateOnly,
    [switch]$AllowMissing
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version 2.0

if ([string]::IsNullOrWhiteSpace($BaseDir)) { $BaseDir = Split-Path -Parent $PSScriptRoot }
if ([string]::IsNullOrWhiteSpace($Manifest)) { $Manifest = Join-Path $PSScriptRoot 'source-archive-manifest.json' }

Add-Type -AssemblyName System.IO.Compression
Add-Type -AssemblyName System.IO.Compression.FileSystem

function Read-BuildVariables {
    param([string]$Root, [string[]]$Files)

    $values = @{}
    foreach ($relative in $Files) {
        $path = Join-Path $Root $relative
        if (-not (Test-Path -LiteralPath $path -PathType Leaf)) { continue }
        foreach ($line in [IO.File]::ReadAllLines($path)) {
            if ($relative.EndsWith('.bat', [StringComparison]::OrdinalIgnoreCase)) {
                if ($line -match '^\s*set\s+"?([A-Za-z0-9_]+)=(.*?)"?\s*$') {
                    $values[$matches[1]] = $matches[2].TrimEnd('"')
                }
            }
            elseif ($line -match '^\s*([A-Za-z0-9_]+)\s*=\s*(.*?)\s*$' -and -not $line.TrimStart().StartsWith('#')) {
                $values[$matches[1]] = $matches[2]
            }
        }
    }
    return $values
}

function Expand-BuildValue {
    param([string]$Value, [hashtable]$Variables)

    $expanded = $Value
    for ($pass = 0; $pass -lt 20; $pass++) {
        $before = $expanded
        $expanded = [regex]::Replace($expanded, '\$\(([A-Za-z0-9_]+)\)', {
            param($match)
            $key = $match.Groups[1].Value
            if ($Variables.ContainsKey($key)) { return [string]$Variables[$key] }
            return $match.Value
        })
        if ($expanded -eq $before) { break }
    }
    return $expanded
}

function Get-RelativePath {
    param([string]$Root, [string]$Path)

    if ([IO.Path]::GetFullPath($Root).TrimEnd('\') -eq [IO.Path]::GetFullPath($Path).TrimEnd('\')) { return '.' }
    $rootUri = New-Object Uri(($Root.TrimEnd('\') + '\'))
    $pathUri = New-Object Uri($Path)
    return [Uri]::UnescapeDataString($rootUri.MakeRelativeUri($pathUri).ToString())
}

function Test-Excluded {
    param([string]$RelativePath, $Settings)

    $segments = $RelativePath.Replace('\', '/').Split('/')
    foreach ($segment in $segments) {
        foreach ($excluded in $Settings.excludedDirectoryNames) {
            if ($segment.Equals([string]$excluded, [StringComparison]::OrdinalIgnoreCase)) { return $true }
            if ($segment -match '^vc\d+(x64)?$') { return $true }
        }
    }
    $extension = [IO.Path]::GetExtension($RelativePath)
    foreach ($excludedExtension in $Settings.excludedFileExtensions) {
        if ($extension.Equals([string]$excludedExtension, [StringComparison]::OrdinalIgnoreCase)) { return $true }
    }
    return $false
}

function Get-GitFiles {
    param([string]$Root, [bool]$TrackedOnly)

    $arguments = @('-C', $Root, 'ls-files', '--cached')
    if (-not $TrackedOnly) { $arguments += @('--others', '--exclude-standard') }
    $items = @(& git @arguments)
    if ($LASTEXITCODE -ne 0) { throw "git ls-files failed in $Root" }
    return $items | ForEach-Object { Join-Path $Root $_ } | Where-Object { Test-Path -LiteralPath $_ -PathType Leaf }
}

function Get-ComponentFiles {
    param([string]$Root, [bool]$TrackedOnly, $Settings)

    $gitDir = Join-Path $Root '.git'
    if (Test-Path -LiteralPath $gitDir) {
        $tracked = @(Get-GitFiles -Root $Root -TrackedOnly $true)
        if ($TrackedOnly) { return @($tracked | Sort-Object -Unique) }
        $trackedSet = New-Object 'Collections.Generic.HashSet[string]' ([StringComparer]::OrdinalIgnoreCase)
        foreach ($file in $tracked) { $null = $trackedSet.Add([IO.Path]::GetFullPath($file)) }
        $untracked = @(Get-GitFiles -Root $Root -TrackedOnly $false | Where-Object {
            -not $trackedSet.Contains([IO.Path]::GetFullPath($_))
        } | Where-Object {
            $relative = Get-RelativePath -Root $Root -Path $_
            -not (Test-Excluded -RelativePath $relative -Settings $Settings)
        })
        return @(($tracked + $untracked) | Sort-Object -Unique)
    }
    $files = Get-ChildItem -LiteralPath $Root -File -Recurse | Select-Object -ExpandProperty FullName
    return @($files | Where-Object {
        $relative = Get-RelativePath -Root $Root -Path $_
        -not (Test-Excluded -RelativePath $relative -Settings $Settings)
    } | Sort-Object -Unique)
}

function Get-GitMetadata {
    param([string]$Root)

    if (-not (Test-Path -LiteralPath (Join-Path $Root '.git'))) { return $null }
    $head = (& git -C $Root rev-parse HEAD 2>$null | Select-Object -First 1)
    $remote = (& git -C $Root remote get-url origin 2>$null | Select-Object -First 1)
    $dirty = @(& git -C $Root status --porcelain 2>$null).Count -gt 0
    return [ordered]@{ head = $head; origin = $remote; dirty = $dirty }
}

function New-DeterministicZip {
    param([string]$Root, [string[]]$Files, [string]$Destination)

    $stream = [IO.File]::Open($Destination, [IO.FileMode]::Create)
    try {
        $zip = New-Object IO.Compression.ZipArchive($stream, [IO.Compression.ZipArchiveMode]::Create, $false)
        try {
            foreach ($file in $Files) {
                $entryName = Get-RelativePath -Root $Root -Path $file
                $entry = $zip.CreateEntry($entryName, [IO.Compression.CompressionLevel]::Optimal)
                $entry.LastWriteTime = [DateTimeOffset]::new(2000, 1, 1, 0, 0, 0, [TimeSpan]::Zero)
                $input = [IO.File]::OpenRead($file)
                $output = $entry.Open()
                try { $input.CopyTo($output) }
                finally { $output.Dispose(); $input.Dispose() }
            }
        }
        finally { $zip.Dispose() }
    }
    finally { $stream.Dispose() }
}

$basePath = (Resolve-Path -LiteralPath $BaseDir).Path
$manifestPath = (Resolve-Path -LiteralPath $Manifest).Path
$settings = Get-Content -LiteralPath $manifestPath -Raw | ConvertFrom-Json
if ($settings.schemaVersion -ne 1) { throw "Unsupported source archive manifest schema: $($settings.schemaVersion)" }

$variables = Read-BuildVariables -Root $basePath -Files @($settings.pinFiles)
if (-not $variables.ContainsKey('SRC_DIR')) { $variables['SRC_DIR'] = 'src' }

$componentList = New-Object Collections.Generic.List[object]
foreach ($definition in $settings.components) {
    $expandedPath = Expand-BuildValue -Value ([string]$definition.path) -Variables $variables
    $fullPath = [IO.Path]::GetFullPath((Join-Path $basePath $expandedPath))
    $optional = ($definition.PSObject.Properties.Name -contains 'optional') -and [bool]$definition.optional
    if ([string]$definition.kind -eq 'children') {
        if (Test-Path -LiteralPath $fullPath -PathType Container) {
            foreach ($child in Get-ChildItem -LiteralPath $fullPath -Directory | Sort-Object Name) {
                $componentList.Add([pscustomobject]@{ name = $child.Name; path = $child.FullName; optional = $false; trackedOnly = $false })
            }
        }
        else {
            $componentList.Add([pscustomobject]@{ name = [string]$definition.name; path = $fullPath; optional = $optional; trackedOnly = $false })
        }
    }
    else {
        $trackedOnly = ($definition.PSObject.Properties.Name -contains 'trackedOnly') -and [bool]$definition.trackedOnly
        $componentList.Add([pscustomobject]@{ name = [string]$definition.name; path = $fullPath; optional = $optional; trackedOnly = $trackedOnly })
    }
}

$missingRequired = New-Object Collections.Generic.List[string]
$inventory = New-Object Collections.Generic.List[object]
$runPath = $null
if (-not $ValidateOnly) {
    if ([string]::IsNullOrWhiteSpace($OutputDir)) { $OutputDir = Join-Path $basePath 'source-archives' }
    $outputRoot = [IO.Path]::GetFullPath($OutputDir)
    [IO.Directory]::CreateDirectory($outputRoot) | Out-Null
    $runPath = Join-Path $outputRoot (Get-Date -Format 'yyyyMMdd-HHmmss')
    [IO.Directory]::CreateDirectory($runPath) | Out-Null
}

foreach ($component in $componentList) {
    if (-not (Test-Path -LiteralPath $component.path -PathType Container)) {
        $status = if ($component.optional) { 'optional-missing' } else { 'missing' }
        if (-not $component.optional) { $missingRequired.Add($component.name) }
        $inventory.Add([ordered]@{ name = $component.name; path = $component.path; status = $status; fileCount = 0; archive = ''; sha256 = ''; bytes = 0; git = $null })
        Write-Host "$($component.name): $status"
        continue
    }

    $files = @(Get-ComponentFiles -Root $component.path -TrackedOnly $component.trackedOnly -Settings $settings)
    $record = [ordered]@{
        name = $component.name
        path = Get-RelativePath -Root $basePath -Path $component.path
        status = if ($ValidateOnly) { 'validated' } else { 'archived' }
        fileCount = $files.Count
        git = Get-GitMetadata -Root $component.path
        archive = ''
        sha256 = ''
        bytes = 0
    }
    if (-not $ValidateOnly) {
        $safeName = $component.name -replace '[^A-Za-z0-9._-]', '_'
        $zipPath = Join-Path $runPath ($safeName + '.zip')
        Write-Host "Archiving $($component.name) ($($files.Count) files)..."
        New-DeterministicZip -Root $component.path -Files $files -Destination $zipPath
        $record.archive = [IO.Path]::GetFileName($zipPath)
        $record.sha256 = (Get-FileHash -LiteralPath $zipPath -Algorithm SHA256).Hash.ToLowerInvariant()
        $record.bytes = (Get-Item -LiteralPath $zipPath).Length
    }
    else {
        Write-Host "$($component.name): validated ($($files.Count) files)"
    }
    $inventory.Add($record)
}

$pins = New-Object Collections.Generic.List[object]
foreach ($key in @($variables.Keys | Sort-Object)) {
    if ($key -match '(_BRANCH|_VER|_VERSION|_SRC)$' -or $key -match '^(gdal|ms|mapcache)_') {
        $pins.Add([ordered]@{ name = $key; value = Expand-BuildValue -Value ([string]$variables[$key]) -Variables $variables })
    }
}

if (-not $ValidateOnly) {
    $result = [ordered]@{
        schemaVersion = 1
        createdUtc = [DateTime]::UtcNow.ToString('o')
        baseDirectory = $basePath
        manifest = Get-RelativePath -Root $basePath -Path $manifestPath
        components = $inventory
        pins = $pins
    }
    $jsonPath = Join-Path $runPath 'source-archives-manifest.json'
    [IO.File]::WriteAllText($jsonPath, ($result | ConvertTo-Json -Depth 8), (New-Object Text.UTF8Encoding($false)))
    $markdown = New-Object Collections.Generic.List[string]
    $markdown.Add('# Source archive inventory')
    $markdown.Add('')
    $markdown.Add("Created UTC: $($result.createdUtc)")
    $markdown.Add('')
    $markdown.Add('| Component | Status | Files | Archive | SHA-256 |')
    $markdown.Add('|---|---:|---:|---|---|')
    foreach ($item in $inventory) {
        $markdown.Add("| $($item.name) | $($item.status) | $($item.fileCount) | $($item.archive) | $($item.sha256) |")
    }
    [IO.File]::WriteAllLines((Join-Path $runPath 'source-archives-manifest.md'), $markdown, (New-Object Text.UTF8Encoding($false)))
    Write-Host "Source archives written to: $runPath"
}

if ($missingRequired.Count -gt 0 -and -not $AllowMissing) {
    throw "Required source components are missing: $($missingRequired -join ', ')"
}

