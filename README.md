# GISInternals Build System

This repository contains the Windows build automation used for the
GISInternals daily SDK builds. It builds GDAL, MapServer, MapCache, their
dependencies, language bindings, installers, and release ZIP packages with
`nmake` and Visual Studio toolchains.

The normal scheduled entry point is `makevc.bat`. It runs the currently active
Visual Studio 2019 and 2022 build scripts in sequence and writes dashboard logs
under `C:\Inetpub\wwwroot\sdk\build-output`.

## Main Entry Points

`makevc.bat` is the daily aggregate runner. It sets WiX light options and calls:

- `makevc16.bat`
- `makevc16x64.bat`
- `makevc17.bat`
- `makevc17x64.bat`

Each compiler script initializes the correct Visual Studio command environment
with `vcvars32.bat` or `vcvars64.bat`, switches to drive `E:`, sets a compiler
id such as `vc16x64` or `vc17x64`, calls `setversions.bat`, then selects the
requested build mode.

The common build pipeline is `makepackage-cmake.bat`. It is called by the
compiler-specific scripts after they have set variables such as `logid`,
`gdal-dir`, `ms-dir`, `pkg-version`, `GDAL_BRANCH`, `MAPSERVER_BRANCH`, and
`MAPCACHE_BRANCH`.

## Build Modes

With no argument, each modern compiler script performs three phases:

1. Development build from active upstream development branches.
2. Stable branch build for the versions in `setversions.bat`.
3. SDK/development package creation with the `package-dev` target.

Supported arguments:

- `dev` runs only the development branch build.
- `stable` skips the development branch build and runs the stable branch build,
  followed by SDK/development packaging.
- `rel` builds a release tag using the release numbers from `setversions.bat`.
- `mapmanager` runs the MapManager packaging path where enabled.
- `nuget` is handled by `makevc16x64.bat` and runs the release/NuGet path.

Older scripts such as `makevc7.bat` through `makevc15x64.bat` are retained for
previous compiler generations. The current aggregate runner uses only VS 2019
and VS 2022.

## Version Control

`setversions.bat` defines the MapServer, GDAL, and MapCache versions used by
stable and release builds. At the time of this file:

- MapServer stable branch: `branch-8-6`
- MapServer release tag: `rel-8-6-0`
- GDAL stable branch: `release/3.12`
- GDAL release tag: `v3.12.1`
- MapCache stable branch: `branch-1-14`
- MapCache release tag: `rel-1-14-1`

The compiler scripts translate those values into source directory names and
package names:

- Development build:
  - `GDAL_BRANCH=master`
  - `MAPSERVER_BRANCH=main`
  - `MAPCACHE_BRANCH=main`
  - package version `gdal-mapserver`
- Stable build:
  - `GDAL_BRANCH=release/<gdal_major>.<gdal_minor>`
  - `MAPSERVER_BRANCH=branch-<ms_version>`
  - `MAPCACHE_BRANCH=branch-<mapcache_major>-<mapcache_minor>`
  - package version `gdal-<gdal_major>-<gdal_minor>-mapserver-<ms_version>`
- Release build:
  - `GDAL_BRANCH=v<gdal_major>.<gdal_minor>.<gdal_rel>`
  - `MAPSERVER_BRANCH=rel-<ms_version>-<ms_rel>`
  - `MAPCACHE_BRANCH=rel-<mapcache_major>-<mapcache_minor>-<mapcache_rel>`
  - package version includes the GDAL and MapServer release numbers.

The `Makefile` then appends the CMake build directory to source directories.
For example, `gdal` on VS 2022 x64 becomes `gdal-vc17x64`, while
`gdal-3-12` becomes `gdal-3-12-vc17x64`.

## Configuration

`config.opt` is included by `Makefile` and is the main build configuration
file. It controls:

- GDAL feature flags such as GEOS, PostGIS, ECW, FileGDB, Curl, Spatialite,
  CSharp, Python, Java, Xerces, Oracle, MrSID, PROJ 9, WebP, Zstandard, and
  PDF support.
- MapServer feature flags such as PROJ 9, FreeType, GEOS, GDAL, PostGIS,
  CSharp, Oracle, Java, Python, FastCGI, Cairo, GIF, protobuf-c, WMS/WFS/WCS
  server/client support, and MapCache.
- Dependency source locations, branch names, and versions.
- Local SDK locations for commercial or external dependencies such as ECW,
  FileGDB, Oracle, and MrSID.
- Global build switches such as `ENABLE_DEPENDENCIES`, `BUILD_OUTDATED_TARGETS`,
  `NO_CLEAN`, `NO_BUILD`, and `DEBUG`.

When `ENABLE_DEPENDENCIES` is enabled, the Makefile can build dependency
libraries from scratch. The dependency targets are tied to the expected outputs,
so missing files in the selected `release-*` output directory cause the
corresponding dependency to be rebuilt.

`detect_mrsid.opt` is included when MrSID support is enabled and the file is
present. It detects and configures the installed MrSID SDK layout.

## Makefile Responsibilities

`Makefile` is the real build graph. It detects the active MSVC/NMake version,
sets `MSVC_VER`, selects the CMake generator, and derives the output directory:

- x86 VS 2019: `release-1929`
- x64 VS 2019: `release-1929-x64`
- x86 VS 2022: `release-1944`
- x64 VS 2022: `release-1944-x64`

The default install root is `C:\Inetpub\wwwroot\sdk`, while scheduled packages
are copied to `C:\Inetpub\wwwroot\sdk\downloads`.

Important targets:

- `update` clones or updates GDAL, MapServer, and MapCache, checks out the
  requested branches, resets to the requested revisions, and writes revision
  files into `$(OUTPUT_DIR)\doc`.
- `rebuild-gdal-cmake` removes old GDAL/MapServer output and builds GDAL with
  CMake, including MSSQL plugin variants.
- `gdal-csharp-test-cmake` runs GDAL C# CTest tests.
- `gdal-python-cmake-all` builds Python binary distributions for configured
  Python versions and architectures.
- `gdalversion` writes the detected GDAL version metadata.
- `gdal-autotest` runs the GDAL pytest suite for core, OGR, OSR, algorithms,
  GNM, and utilities.
- `mkgdalinst` creates GDAL installers, including optional Oracle, ECW, MrSID,
  and FileGDB installers.
- `ms` builds MapServer and writes MapServer dependency metadata.
- `mapcache` builds MapCache.
- `ms-csharp-test`, `ms-java-test`, `ms-php-test`, `ms-python-bdist`, and
  `ms-autotest` handle MapServer bindings and tests.
- `op-disable` is currently used as the MapServer installer step placeholder.
- `package` signs installer files, creates the runtime ZIP, copies
  documentation and installers, and uploads the public artifacts.
- `package-libs` creates the headers/libs ZIP and uploads it.
- `package-dev` creates the larger development ZIP containing the output tree,
  Makefile, config files, licenses, and support files.

## Common Package Pipeline

`makepackage-cmake.bat` executes the standard CMake-based package pipeline. For
each step it:

1. Sets `nmakecmd` to the Makefile target.
2. Writes a "started" entry to `%logid%.html`.
3. Writes a yellow status file named `status-%logid%.html`.
4. Runs `nmake %nmakecmd%`, redirecting stdout and stderr to timestamped files.
5. Updates status and log HTML with success or failure.

The target order is:

1. `update`
2. `rebuild-gdal-cmake SWIG_VER=4.0.2`
3. `gdal-csharp-test-cmake`
4. `gdal-python-cmake-all SWIG_VER=4.0.2`
5. `gdalversion`
6. `gdal-autotest`
7. `mkgdalinst`
8. `ms SWIG_VER=4.0.2`
9. `mapcache`
10. `ms-csharp-test`
11. `ms-java-test`
12. `ms-php-test`
13. `ms-python-bdist`
14. `ms-autotest`
15. `op-disable`
16. `package PKG_VERSION=%pkg-version% INSTALL_DIR=C:\Inetpub\wwwroot\sdk\downloads`
17. `package-libs PKG_VERSION=%pkg-version% INSTALL_DIR=C:\Inetpub\wwwroot\sdk\downloads`

Most core build and packaging failures jump to `:exit` and stop the remaining
pipeline. Some test failures are logged but do not stop the rest of the script.

## Signing and Publishing

The release/package phase includes code signing before artifacts are copied and
published. The Makefile calls `cert\signdir.bat` for files in
`$(OUTPUT_DIR)\install`, which signs generated `.msi` and `.exe` installers
with `signtool`, a public certificate selected by thumbprint, SHA-256 file
digests, and the configured timestamp server. MapManager packaging uses
`cert\sign.bat` to sign its MSI directly.

After packaging, the Makefile copies artifacts into
`C:\Inetpub\wwwroot\sdk\downloads` and uses `uploadftp.bat` /
`uploadftpdir.bat` to publish runtime ZIPs, headers/libs ZIPs, source/dev ZIPs,
installers, and documentation to the GISInternals download area on
`www.gisinternals.com`.

Build logs and dashboard snippets are written under
`C:\Inetpub\wwwroot\sdk\build-output`, so the same web root exposes both the
downloadable artifacts and the build status/log pages.

## Logging and Dashboard Output

Every scheduled step writes three kinds of files to
`C:\Inetpub\wwwroot\sdk\build-output`:

- `%logid%.html` is the build history for that compiler/mode.
- `status-%logid%.html` is the current dashboard status snippet.
- `%compiler%-%timestamp%-%logid%.txt` and `...-err.txt` are stdout and stderr
  for the individual step.

The timestamp is derived from `%date% %time%`, so every step gets unique stdout
and stderr links in the HTML build history.

Typical `logid` values:

- `vc17x64-dev`
- `vc17x64-stable-3-12-8-6`
- `vc17x64-sdk`
- `vc17x64-released-3-12-8-6`

## Outputs

Build output directories are named from the detected compiler version:

- `release-1929`
- `release-1929-x64`
- `release-1944`
- `release-1944-x64`

Runtime packages are named like:

- `release-1944-x64-gdal-mapserver.zip`
- `release-1944-x64-gdal-3-12-mapserver-8-6.zip`
- `release-1944-x64-gdal-3-12-mapserver-8-6-libs.zip`
- `release-1944-x64-dev.zip`

The Makefile copies packages to `C:\Inetpub\wwwroot\sdk\downloads` and calls
`uploadftp.bat` / `uploadftpdir.bat` to publish release files and documentation
to the public download site.

The `src` tree and the `release-*` output directories are generated working
state. If they are removed, the next build recreates the missing source clones
and rebuilds missing output artifacts, including dependencies when
`ENABLE_DEPENDENCIES` is set.

## Running Manually

Run commands from a normal command prompt with access to the configured Visual
Studio installations and local SDK dependency paths.

```bat
makevc.bat
makevc17x64.bat dev
makevc17x64.bat stable
makevc17x64.bat rel
makevc16x64.bat nuget
```

For one-off Makefile work, first enter the matching Visual Studio environment,
then run `nmake` directly:

```bat
call "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars64.bat"
nmake update
nmake rebuild-gdal-cmake
nmake ms
nmake package PKG_VERSION=gdal-mapserver INSTALL_DIR=C:\Inetpub\wwwroot\sdk\downloads
```

## Maintenance Notes

- Update `setversions.bat` when changing the stable or release GDAL, MapServer,
  or MapCache versions.
- Update `config.opt` when changing dependency versions, source URLs, feature
  flags, or local SDK paths.
- If a new Visual Studio toolset reports an unknown `_NMAKE_VER`, add it to the
  compiler detection section in `Makefile` with the correct `MSVC_VER`,
  `MESON_BACKEND`, `CMAKE_GENERATOR`, and `CMAKE_BUILDDIR`.
- Keep `cert\sign.bat`, `cert\signdir.bat`, and the machine certificate store
  in sync when the public code signing certificate is renewed or replaced.
- Keep `uploadftp.bat` and `uploadftpdir.bat` in sync with the current
  GISInternals publishing endpoint and credentials.
- The `update-*` targets run `git clean -fd` and `git reset --hard` inside the
  cloned GDAL, MapServer, and MapCache source directories. Do not keep manual
  changes in those generated source trees.
- A full rebuild can be forced by removing the relevant generated source and
  output directories, for example `src\...` and `release-1944-x64`. The next
  run regenerates them from `config.opt`, the selected branches, and the
  Makefile targets.
- The current VS 2022 MapManager calls are commented out in `makevc17.bat` and
  `makevc17x64.bat`; VS 2019 scripts still call `makemapmanager.bat`.
