param(
    [Parameter(Mandatory = $true)]
    [string]$SourceDir
)

$cmakeFile = Join-Path $SourceDir 'swig\csharp\CMakeLists.txt'
if (-not (Test-Path -LiteralPath $cmakeFile)) {
    throw "GDAL C# CMake file was not found: $cmakeFile"
}

$needle = '    if ( "${_CSHARP_APPLICATION_SDK_NUMBER}" IN_LIST DOTNET_SDKS )'
$replacement = @'
    file(GLOB _CSHARP_APPLICATION_TARGETING_PACKS
      "$ENV{ProgramFiles}/dotnet/packs/Microsoft.NETCore.App.Ref/${_CSHARP_APPLICATION_SDK_NUMBER}.*")
    if ( "${_CSHARP_APPLICATION_SDK_NUMBER}" IN_LIST DOTNET_SDKS OR _CSHARP_APPLICATION_TARGETING_PACKS )
'@.TrimEnd()

$content = [IO.File]::ReadAllText($cmakeFile)
if ($content.Contains('_CSHARP_APPLICATION_TARGETING_PACKS')) {
    exit 0
}
if (-not $content.Contains($needle)) {
    throw "Expected GDAL C# SDK check was not found in $cmakeFile"
}

$content = $content.Replace($needle, $replacement)
[IO.File]::WriteAllText($cmakeFile, $content, [Text.UTF8Encoding]::new($false))
