[CmdletBinding()]
param(
    [string]$ConfigPath,
    [string]$SetVersionsPath,
    [string]$OutputJson,
    [string]$OutputMarkdown
)

Set-StrictMode -Version 2.0
$ErrorActionPreference = 'Stop'
$projectRoot = Split-Path $PSScriptRoot -Parent
if (-not $ConfigPath) { $ConfigPath = Join-Path $projectRoot 'config.opt' }
if (-not $SetVersionsPath) { $SetVersionsPath = Join-Path $projectRoot 'setversions.bat' }
$auditDate = Get-Date -Format 'yyyyMMdd'
if (-not $OutputJson) { $OutputJson = Join-Path $projectRoot "doc\dependency-version-audit-$auditDate.json" }
if (-not $OutputMarkdown) { $OutputMarkdown = Join-Path $projectRoot "doc\dependency-version-audit-$auditDate.md" }

function Read-NMakeVariables {
    param([string]$Path)
    $result = @{}
    foreach ($line in Get-Content -LiteralPath $Path) {
        if ($line -match '^\s*([A-Z][A-Z0-9_]*)\s*=\s*(.*?)\s*$') {
            $result[$matches[1]] = $matches[2].Trim()
        }
    }
    return $result
}

function Get-VersionKey {
    param([string]$Tag)
    if ($Tag -match '^lpng1(\d)(\d{2})$') {
        $Tag = '1.' + [int]$matches[1] + '.' + [int]$matches[2]
    }
    $numbers = [regex]::Matches($Tag, '\d+') | ForEach-Object { [int64]$_.Value }
    $key = New-Object System.Collections.Generic.List[long]
    foreach ($number in $numbers) { $key.Add($number) }
    while ($key.Count -lt 6) { $key.Add(0) }
    return (($key | Select-Object -First 6 | ForEach-Object { $_.ToString('D12') }) -join '.')
}

function Read-BatchVariables {
    param([string]$Path)
    $result = @{}
    foreach ($line in Get-Content -LiteralPath $Path) {
        if ($line -match '^\s*set\s+([A-Za-z][A-Za-z0-9_-]*)\s*=\s*(.*?)\s*$') {
            $result[$matches[1]] = $matches[2].Trim()
        }
    }
    return $result
}

$variables = Read-NMakeVariables -Path $ConfigPath
$releaseVariables = Read-BatchVariables -Path $SetVersionsPath
$effectiveReleasePins = @{
    GDAL_BRANCH = 'v' + $releaseVariables['gdal_major'] + '.' + $releaseVariables['gdal_minor'] + '.' + $releaseVariables['gdal_rel']
    MAPSERVER_BRANCH = 'rel-' + $releaseVariables['ms_version'] + '-' + $releaseVariables['ms_rel']
    MAPCACHE_BRANCH = 'rel-' + $releaseVariables['mapcache_major'] + '-' + $releaseVariables['mapcache_minor'] + '-' + $releaseVariables['mapcache_rel']
}
$components = @(
    @{ Name='zlib'; Variable='ZLIB_BRANCH'; Source='https://github.com/madler/zlib.git'; Pattern='^v\d+\.\d+(\.\d+)?$' },
    @{ Name='OpenSSL 3'; Variable='OPENSSL_BRANCH'; Source='https://github.com/openssl/openssl.git'; Pattern='^openssl-3\.\d+\.\d+$' },
    @{ Name='curl'; Variable='CURL_BRANCH'; Source='https://github.com/curl/curl.git'; Pattern='^curl-\d+_\d+_\d+$' },
    @{ Name='libpng'; Variable='LIBPNG_VER'; Source='https://git.code.sf.net/p/libpng/code'; Pattern='^v1\.6\.\d+$' },
    @{ Name='FreeType'; Variable='FREETYPE_BRANCH'; Source='https://github.com/freetype/freetype.git'; Pattern='^VER-\d+-\d+-\d+$' },
    @{ Name='HarfBuzz'; Variable='HARFBUZZ_BRANCH'; Source='https://github.com/harfbuzz/harfbuzz.git'; Pattern='^\d+\.\d+\.\d+$' },
    @{ Name='GEOS'; Variable='GEOS_BRANCH'; Source='https://github.com/libgeos/geos.git'; Pattern='^\d+\.\d+\.\d+$' },
    @{ Name='FriBidi'; Variable='FRIBIDI_BRANCH'; Source='https://github.com/fribidi/fribidi.git'; Pattern='^v\d+\.\d+\.\d+$' },
    @{ Name='PostgreSQL 18 candidate'; Variable='PGSQL_BRANCH'; Source='https://github.com/postgres/postgres.git'; Pattern='^REL_18_\d+$' },
    @{ Name='PROJ'; Variable='PROJ9_BRANCH'; Source='https://github.com/OSGeo/PROJ.git'; Pattern='^\d+\.\d+\.\d+$' },
    @{ Name='PROJ-data'; Variable='PROJ_DATA_BRANCH'; Source='https://github.com/OSGeo/PROJ-data.git'; Pattern='^\d+\.\d+\.\d+$' },
    @{ Name='GDAL'; Variable='GDAL_BRANCH'; Source='https://github.com/OSGeo/gdal.git'; Pattern='^v\d+\.\d+\.\d+$' },
    @{ Name='MapServer'; Variable='MAPSERVER_BRANCH'; Source='https://github.com/MapServer/MapServer.git'; Pattern='^rel-\d+-\d+-\d+$' },
    @{ Name='MapCache'; Variable='MAPCACHE_BRANCH'; Source='https://github.com/MapServer/mapcache.git'; Pattern='^rel-\d+-\d+-\d+$' },
    @{ Name='libxml2'; Variable='LIBXML2_BRANCH'; Source='https://github.com/GNOME/libxml2.git'; Pattern='^v\d+\.\d+\.\d+$' },
    @{ Name='libwebp'; Variable='LIBWEBP_BRANCH'; Source='https://chromium.googlesource.com/webm/libwebp'; Pattern='^v\d+\.\d+\.\d+$' },
    @{ Name='Zstandard'; Variable='ZSTD_BRANCH'; Source='https://github.com/facebook/zstd.git'; Pattern='^v\d+\.\d+\.\d+$' },
    @{ Name='muparser'; Variable='MUPARSER_BRANCH'; Source='https://github.com/beltoforion/muparser.git'; Pattern='^v\d+\.\d+\.\d+$' },
    @{ Name='Xerces-C'; Variable='XERCES_BRANCH'; Source='https://github.com/apache/xerces-c.git'; Pattern='^v\d+\.\d+\.\d+$' },
    @{ Name='Expat'; Variable='LIBEXPAT_BRANCH'; Source='https://github.com/libexpat/libexpat.git'; Pattern='^R_\d+_\d+_\d+$' },
    @{ Name='protobuf 3'; Variable='PROTOBUF_BRANCH'; Source='https://github.com/protocolbuffers/protobuf.git'; Pattern='^v3\.\d+\.\d+$' },
    @{ Name='protobuf-c'; Variable='PROTOBUF_C_BRANCH'; Source='https://github.com/protobuf-c/protobuf-c.git'; Pattern='^v\d+\.\d+\.\d+$' },
    @{ Name='HDF4'; Variable='HDF4_BRANCH'; Source='https://github.com/HDFGroup/hdf4.git'; Pattern='^hdf-4_\d+_\d+$' },
    @{ Name='HDF5 1.14'; Variable='HDF5_BRANCH'; Source='https://github.com/HDFGroup/hdf5.git'; Pattern='^hdf5-1_14_\d+$' },
    @{ Name='libtiff'; Variable='LIBTIFF_BRANCH'; Source='https://gitlab.com/libtiff/libtiff.git'; Pattern='^v\d+\.\d+\.\d+$' },
    @{ Name='libgeotiff'; Variable='LIBGEOTIFF_BRANCH'; Source='https://github.com/OSGeo/libgeotiff.git'; Pattern='^\d+\.\d+\.\d+$' },
    @{ Name='OpenJPEG'; Variable='OPENJPEG_BRANCH'; Source='https://github.com/uclouvain/openjpeg.git'; Pattern='^v\d+\.\d+\.\d+$' },
    @{ Name='FastCGI'; Variable='FCGI_BRANCH'; Source='https://github.com/FastCGI-Archives/fcgi2.git'; Pattern='^\d+\.\d+\.\d+$' },
    @{ Name='libkml'; Variable='LIBKML_BRANCH'; Source='https://github.com/libkml/libkml.git'; Pattern='^\d+\.\d+\.\d+$' },
    @{ Name='MySQL cluster 8'; Variable='MYSQL_BRANCH'; Source='https://github.com/mysql/mysql-server.git'; Pattern='^mysql-cluster-8\.\d+\.\d+$' },
    @{ Name='KEA'; Variable='KEA_BRANCH'; Source='https://github.com/ubarsc/kealib.git'; Pattern='^kealib-\d+\.\d+\.\d+$' },
    @{ Name='NetCDF'; Variable='NETCDF_BRANCH'; Source='https://github.com/Unidata/netcdf-c.git'; Pattern='^v\d+\.\d+\.\d+$' },
    @{ Name='OGDI'; Variable='OGDI_BRANCH'; Source='https://github.com/libogdi/ogdi.git'; Pattern='^ogdi_\d+_\d+_\d+$' },
    @{ Name='Boost'; Variable='BOOST_BRANCH'; Source='https://github.com/boostorg/boost.git'; Pattern='^boost-\d+\.\d+\.\d+$' },
    @{ Name='SWIG'; Variable='SWIG_VER'; CurrentFallback='4.0.2'; Source='https://github.com/swig/swig.git'; Pattern='^rel-\d+\.\d+\.\d+$' },
    @{ Name='CMake'; Variable='CMAKE_TOOL_VER'; CurrentFallback='not pinned'; Source='https://github.com/Kitware/CMake.git'; Pattern='^v4\.\d+\.\d+$' },
    @{ Name='Ninja'; Variable='NINJA_TOOL_VER'; CurrentFallback='not pinned'; Source='https://github.com/ninja-build/ninja.git'; Pattern='^v\d+\.\d+\.\d+$' },
    @{ Name='WinFlexBison'; Variable='WINFLEXBISON_VER'; CurrentFallback='not pinned'; Source='https://github.com/lexxmark/winflexbison.git'; Pattern='^v\d+\.\d+\.\d+$' }
)

$audit = foreach ($component in $components) {
    $pinOwner = 'config.opt'
    if ($effectiveReleasePins.ContainsKey($component.Variable)) {
        $current = $effectiveReleasePins[$component.Variable]
        $pinOwner = 'setversions.bat (effective release)'
    } elseif ($variables.ContainsKey($component.Variable)) {
        $current = $variables[$component.Variable]
    } elseif ($component.ContainsKey('CurrentFallback')) {
        $current = $component.CurrentFallback
        $pinOwner = 'Makefile/default'
    } else {
        $current = $null
    }
    try {
        $lines = & git ls-remote --tags --refs $component.Source 2>&1
        if ($LASTEXITCODE -ne 0) { throw ($lines -join [Environment]::NewLine) }
        $tags = $lines | ForEach-Object { ($_ -split 'refs/tags/', 2)[-1] } |
            Where-Object { $_ -match $component.Pattern } |
            Sort-Object @{ Expression={ Get-VersionKey $_ } }, @{ Expression={ $_ } }
        $latest = $tags | Select-Object -Last 1
        [pscustomobject]@{ name=$component.Name; variable=$component.Variable; current=$current; pinOwner=$pinOwner; latest=$latest; source=$component.Source; checkedAt=(Get-Date).ToString('o'); error=$null }
    } catch {
        [pscustomobject]@{ name=$component.Name; variable=$component.Variable; current=$current; pinOwner=$pinOwner; latest=$null; source=$component.Source; checkedAt=(Get-Date).ToString('o'); error=$_.Exception.Message }
    }
}

$manualAudit = @(
    [pscustomobject]@{ name='IJG JPEG'; variable='JPEG_VER'; current=$variables['JPEG_VER']; pinOwner='config.opt'; latest='jpeg-10'; source='https://ijg.org/'; checkedAt=(Get-Date).ToString('o'); error=$null },
    [pscustomobject]@{ name='GNU libiconv'; variable='LIBICONV_VER'; current=$variables['LIBICONV_VER']; pinOwner='config.opt'; latest='libiconv-1.19'; source='https://ftp.gnu.org/pub/gnu/libiconv/'; checkedAt=(Get-Date).ToString('o'); error=$null },
    [pscustomobject]@{ name='SQLite'; variable='SQLITE_VER'; current=$variables['SQLITE_VER']; pinOwner='config.opt'; latest='3.54.1'; source='https://www.sqlite.org/chronology.html'; checkedAt=(Get-Date).ToString('o'); error=$null }
)
$audit = @($audit) + $manualAudit

$parent = Split-Path $OutputJson -Parent
if (-not (Test-Path -LiteralPath $parent)) { New-Item -ItemType Directory -Path $parent | Out-Null }
$audit | ConvertTo-Json -Depth 4 | Set-Content -LiteralPath $OutputJson -Encoding UTF8

$lines = New-Object System.Collections.Generic.List[string]
$lines.Add('# Dependency version audit')
$lines.Add('')
$lines.Add('Generated: ' + (Get-Date).ToString('yyyy-MM-dd HH:mm:ss K'))
$lines.Add('')
$lines.Add('This report queries authoritative upstream Git tag repositories. It intentionally keeps compatibility lines (OpenSSL 3, PostgreSQL 16/18, protobuf 3, HDF5 1.14, and MySQL Cluster 8) separate from unrelated major releases.')
$lines.Add('')
$lines.Add('| Component | Variable | Current pin | Pin owner | Latest matching tag | Result | Upstream |')
$lines.Add('|---|---|---|---|---|---|---|')
foreach ($item in $audit) {
    $sameVersion = $item.current -and $item.latest -and ((Get-VersionKey $item.current) -eq (Get-VersionKey $item.latest))
    $status = if ($item.error) { 'ERROR' } elseif ($sameVersion) { 'current' } else { 'review' }
    $currentText = if ($item.current) { '`' + $item.current + '`' } else { '—' }
    $latestText = if ($item.latest) { '`' + $item.latest + '`' } else { '-' }
    $lines.Add('| ' + $item.name + ' | `' + $item.variable + '` | ' + $currentText + ' | ' + $item.pinOwner + ' | ' + $latestText + ' | ' + $status + ' | ' + $item.source + ' |')
}
$lines.Add('')
$lines.Add('The IJG JPEG, GNU libiconv, and SQLite rows were checked on their authoritative release pages because their configured sources are archives or do not expose suitable release tags. Other archive-only dependencies and commercial SDKs still require manual verification. A newer tag is a review candidate, not automatic approval to change an ABI or supported compatibility line.')
$lines | Set-Content -LiteralPath $OutputMarkdown -Encoding UTF8

Write-Host "Wrote $OutputJson"
Write-Host "Wrote $OutputMarkdown"
if (@($audit | Where-Object { $_.error }).Count -gt 0) { exit 1 }
