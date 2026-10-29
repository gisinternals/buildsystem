# GISInternals Build System

This repository contains the Windows build automation used for the
GISInternals daily SDK builds. It builds GDAL, MapServer, MapCache, their
dependencies, language bindings, installers, and release ZIP packages with
`nmake` and Visual Studio toolchains.

The normal scheduled entry point is `makevc.bat`. It runs the currently active
Visual Studio 2019 and 2022 build scripts in sequence and writes dashboard logs
under `C:\Inetpub\wwwroot\sdk\build-output`.

`build.bat` is an optional operator wrapper. It does not replace the scheduled
`makevc.bat` entry point or its HTML dashboard logging. It calls the same
compiler scripts and adds timestamped plain-text logs and short summaries under
`doc\build-logs` (which is ignored by Git). Examples:

```bat
build.bat
build.bat x64 dev
build.bat vc17x64 stable
build.bat vc16x64 nuget
build.bat nmake vc17x64 build-tools
```

The first command runs all four compiler scripts in the same order as
`makevc.bat`. Run `build.bat help` for all selectors. The direct `nmake` form is
intended for focused maintenance targets and accepts additional `NAME=VALUE`
arguments after the target.

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
- MapServer release tag: `rel-8-6-6`
- GDAL stable branch: `release/3.13`
- GDAL release tag: `v3.13.3`
- MapCache stable branch: `branch-1-16`
- MapCache release tag: `rel-1-16-0`

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

The accepted third-party pin snapshot (audited 2026-10-24) is summarized
below. `config.opt` remains authoritative; update this summary and rerun the pin
audit whenever those values change.

| Group | Pins |
|---|---|
| Build helpers | SWIG 4.0.2; CMake 4.4.4; Ninja 1.13.2; WinFlexBison 2.5.25; pkg-config-lite 0.28-1; Python 3.10 |
| Compression, TLS, HTTP | zlib 1.3.2; OpenSSL 3.6.5; curl 8.23.0; libpng 1.6.59; IJG JPEG 10; libtiff 4.7.2; Zstandard 1.5.7; WebP 1.6.0 |
| Spatial and database | GEOS 3.14.1; PostgreSQL 18.6; PROJ 9.9.0; PROJ-data 1.25.0; SQLite 3.54.1; SpatiaLite 5.1.0; FreeXL 2.0.0; librttopo 1.1.0; OGDI 4.1.1 |
| Text, XML, rendering | FreeType 2.15.0; HarfBuzz 12.3.0; FriBidi 1.0.17; libiconv 1.19; libxml2 2.15.4; Expat 2.9.0; Xerces-C 3.3.0; Pixman 0.46.4; Cairo 1.18.4; Fontconfig 2.16.0; uriparser 1.0.0 |
| Formats and support | OpenJPEG 2.5.4; protobuf 3.29.5; protobuf-c 1.5.2; HDF4 4.2.16; HDF5 1.14.3; KEA 1.4.14; netCDF 4.8.1; CFITSIO 3.49; libkml 1.3.0; muparser 2.3.5; Poppler 0.89.0; MySQL Cluster 8.1.0 |
| MapCache/legacy web dependencies | APR 1.7.4; APR-util 1.6.3; PCRE 8.45; HTTP Server 2.4.66; FastCGI 2.4.7; giflib 5.0.5; libsvg/libsvg-cairo 0.5.0 |

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

## Build Helper Tools and Downloads

The build pins and bootstraps CMake, Ninja, WinFlexBison, and pkg-config-lite
under `src` instead of relying on whichever versions happen to be in `PATH`.
Their versions are set in `config.opt`; successful extraction is recorded by
versioned stamp files in the selected `release-*\build` directory.

- `nmake build-tools` prepares CMake and Ninja.
- `nmake postgres-tools` prepares WinFlexBison, pkg-config-lite, and Ninja for
  the PostgreSQL 18 build.
- `CMAKE_EXE`, `NINJA_EXE`, `PGSQL_FLEX_EXE`, `PGSQL_BISON_EXE`, and
  `PKG_CONFIG_EXE` can be set in `config.opt` or on the `nmake` command line to
  use administrator-managed tools. When all executables supplied by one helper
  are overridden, its pinned download prerequisite is suppressed.

Downloads validate TLS certificates by default. For a trusted environment with
an intercepting proxy, `INSECURE_DOWNLOADS=YES` can be supplied as an explicit
local override, for example:

```bat
nmake build-tools INSECURE_DOWNLOADS=YES
```

Do not commit that setting to `config.opt`.

## Phase 3 Dependency Automation

GNU libiconv and OGDI now run their generated shell scripts automatically
through Cygwin; no manual Cygwin handoff is required. The Makefile looks for
`E:\cygwin` and then `C:\cygwin`, or `CYGWIN_DIR` can point to another
installation. Cygwin must provide `bash`, `make`, `dos2unix`, `chmod`,
`cygpath`, and the binutils used by the existing MSVC compatibility scripts.
OGDI remains gated by `GDAL_OGDI` in the normal GDAL dependency graph; the
focused `ogdi` target can be used to validate it independently.

PostgreSQL 18/libpq is built with Meson and the pinned Ninja, WinFlexBison, and
pkg-config-lite helpers. Its build environment is scoped to the Meson command,
including `CC=cl`, `CXX=cl`, and the output-local pkg-config directory. libxml2
uses its current CMake build with explicit zlib and iconv locations.

Focused targets are available for validation:

```bat
build.bat nmake vc17x64 iconv ENABLE_DEPENDENCIES=1
build.bat nmake vc17x64 ogdi ENABLE_DEPENDENCIES=1
build.bat nmake vc17x64 libxml2 ENABLE_DEPENDENCIES=1
build.bat nmake vc17x64 postgresql ENABLE_DEPENDENCIES=1
build.bat nmake vc17x64 phase3-dependencies ENABLE_DEPENDENCIES=1
```

Use `vc17` instead of `vc17x64` for x86. Versioned pin stamps under
`release-*\build` force these recipes to reconfigure when their selected
libiconv, OGDI, libxml2, or PostgreSQL pin changes. For ABI-affecting upgrades,
use fresh source and output directories before rebuilding downstream GDAL and
MapServer consumers.

`detect_mrsid.opt` is included when MrSID support is enabled and the file is
present. It detects and configures the installed MrSID SDK layout.

The complete host, SDK, signing, and publishing prerequisites are documented
in [doc/build-prerequisites.md](doc/build-prerequisites.md). Apache/MS4W work
found in the C2 prototype remains a separate future project; its boundary is
recorded in [doc/ms4w-future-work.md](doc/ms4w-future-work.md).

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
- `source-archives-validate` inventories the configured source tree without
  writing archives.
- `source-archives` creates component ZIP files plus JSON/Markdown inventories
  containing file counts, Git state, resolved pins, sizes, and SHA-256 hashes.

## Reproducible source archives

After source acquisition (normally after a clean build), archive the exact
inputs used by the build:

```bat
build.bat nmake vc17x64 source-archives
```

The output is written below `source-archives\<timestamp>` by default. To use a
separate retention volume:

```bat
build.bat nmake vc17x64 source-archives SOURCE_ARCHIVE_DIR=E:\archives\gisinternals-sources
```

`support\source-archive-manifest.json` controls the inventory. The buildsystem
archive contains Git-tracked files using their current working-tree content.
Every component directly below `SRC_DIR` is discovered automatically. Git
components include tracked files and non-ignored local additions; unpacked
archive components include their current source files. Git/SVN metadata and
common compiler, CMake, packaging, and install outputs are excluded. The
resolved version/source variables from `config.opt` and `setversions.bat` are
recorded in the generated inventory. Commercial SDKs are recorded as host
prerequisites and are not archived.

Use the validation-only form before a run:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File support\archive-sources.ps1 -ValidateOnly
```

## GDAL and MapServer CMake Compatibility

The GDAL CMake build explicitly enables the configured C#, Java, and Python
bindings and disables each binding when its matching `GDAL_*` flag is absent.
The C# application target is .NET 8, while the managed library remains
`netstandard2.0`. The C# binding is built serially before the install target to
avoid concurrent .NET restore/build failures. PostgreSQL, SQLite/SpatiaLite,
FastCGI, and their include/library locations are also passed explicitly to
current GDAL, MapServer, and MapCache CMake discovery.

Python 3.10 is the default. `PYTHON_VERSION` supplies the import-library suffix
used by MapServer, and `GDAL_PYTHON_DIRS_X64` / `GDAL_PYTHON_DIRS_X86` list the
installed interpreter directories for `gdal-python-cmake-all`. Space-separate
additional directories when more Python versions are installed. That target
creates both the normal binary distribution and ZIP form for every listed
interpreter.

NuGet manifests use output-directory properties instead of fixed paths.
`NUGET_COMPILER_VER` defaults to `1929`, preserving the scheduled
`makevc16x64.bat nuget` workflow. To package an already-built VS 2022 x86/x64
pair instead, run:

```bat
build.bat nmake vc17x64 gdal-nuget NUGET_COMPILER_VER=1944 NO_SIGN=YES
```

The native NuGet manifest uses wildcards for the VC runtime families so newer
runtime files such as `msvcp140_atomic_wait.dll`,
`msvcp140_codecvt_ids.dll`, and `vcruntime140_threads.dll` are included when
present. MSI installers continue to obtain the corresponding runtime through
the compiler-specific merge module.

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

Scheduled builds retain that behavior by default. For validation in a staging
directory, define `NO_SIGN=YES` and `NO_PUBLISH=YES`; packages are still created
and copied to `INSTALL_DIR`, but certificate signing, FTP upload, NuGet signing,
and NuGet push commands are skipped. For example:

```bat
build.bat nmake vc17x64 package PKG_VERSION=test INSTALL_DIR=E:\build-staging NO_SIGN=YES NO_PUBLISH=YES
```

These are explicit command-line controls and should not be enabled in the
production `config.opt`.

Before switching a refreshed checkout into production, run development,
stable, and explicit release packaging for x86 and x64 on each supported
compiler with `NO_SIGN=YES NO_PUBLISH=YES` and a staging `INSTALL_DIR`. Verify
the C#, Java, and Python tests, GDAL/MapServer test suites, installers, runtime
ZIP, headers/libs ZIP, development ZIP, and NuGet packages against the current
production artifact classes. This validation does not change the normal
scheduled behavior once the suppression flags are omitted.

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
- Run the dependency pin audit before a dependency refresh and before preparing
  a release:

  ```powershell
  powershell -NoProfile -ExecutionPolicy Bypass -File support\audit-dependency-pins.ps1
  ```

  The audit queries authoritative upstream tag repositories and selected
  release pages. It writes dated Markdown and JSON reports under `doc`. A newer
  tag is a review candidate; the script does not edit `config.opt` or
  `setversions.bat`.
- Run the Phase 1 baseline capture before and after substantial buildsystem or
  dependency changes:

  ```powershell
  powershell -NoProfile -ExecutionPolicy Bypass -File support\capture-phase1-baseline.ps1
  ```

  It records toolchain availability, generated outputs, package artifacts,
  repeated version definitions, and signing/publishing call sites in
  `doc\phase1-baseline.md` and `doc\phase1-baseline.json`. It inspects the
  checkout only; it does not compile, sign, publish, or delete files.
- Treat `setversions.bat` as the authority for effective GDAL, MapServer, and
  MapCache stable/release selections used by `makevc*.bat`. The corresponding
  values in `config.opt` are fallbacks for direct `nmake` use. Third-party pins
  remain authoritative in `config.opt`. Capture the original Phase 1 baseline
  before applying accepted pins on an upgrade branch. The matching build recipe
  and compatibility work may then follow on that branch before production
  cutover.
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

## Clean rebuild and recovery

For an upgrade validation, retain the previous production checkout and its
packages. Start from a separate checkout and remove only that checkout's
generated `src`, `release-*`, helper-tool, local-log, and source-archive trees.
Never clean the active production directory. Provision the prerequisites, run
the four compiler/architecture combinations with `NO_SIGN=YES NO_PUBLISH=YES`
and a staging `INSTALL_DIR`, then run stable, release, SDK/development, and
NuGet packaging checks.

Before cutover, stop or disable the scheduled task, preserve its command line,
account, working directory, credentials, and current production directory, and
point it to the validated checkout. Run one manual scheduled-equivalent cycle
without publication first. If it fails, stop the new task invocation and point
the unchanged task configuration back to the preserved production checkout;
do not try to recover by mixing old `src` or `release-*` trees into the new
checkout.

The final manual validation checklist is:

1. `makevc.bat` still invokes VS2019/VS2022 x86/x64 in order and propagates
   failures.
2. Development, stable, `rel`, SDK/development, MapManager, and NuGet entry
   points retain their existing semantics.
3. Binding and autotest results are reviewed, not merely allowed to continue.
4. ZIP/MSI/NuGet contents, enabled drivers, DLL imports, CRT choice, PDBs, and
   artifact names match the expected production classes.
5. Source archives and their SHA-256 inventory are retained with the build.
6. Signing and publication are re-enabled only after staging review.
