# Build host prerequisites

This document describes the host configuration required by the GISInternals
GDAL/MapServer build. Machine-specific paths and credentials must remain local;
do not commit them to `config.opt`.

## Toolchains and command-line tools

- Visual Studio 2019 and Visual Studio 2022 with Desktop development with C++,
  MSVC x86/x64 tools, and a Windows SDK. The scheduled scripts currently expect
  the Community-edition `vcvars32.bat` and `vcvars64.bat` paths used by
  `makevc16*.bat` and `makevc17*.bat`. Set the corresponding `VCVARS_*`
  variables when using another edition or installation directory through
  `build.bat`.
- Windows PowerShell 5.1 or later, Git, curl, and 7-Zip (`7z.exe`) available to
  the build account.
- Python 3.10 x86 at `C:\Python\Python310-32` and x64 at
  `C:\Python\Python310`, unless `PYTHON_BASE`, `PYTHON_DIR`,
  `PYTHON_VERSION`, and `GDAL_PYTHON_DIRS_*` are overridden. Install Meson,
  pytest, and the Python packaging modules used by GDAL/MapServer into both
  interpreters.
- Cygwin at `E:\cygwin` or `C:\cygwin`, or set `CYGWIN_DIR`. Install `bash`,
  GNU make, `dos2unix`, `chmod`, `cygpath`, and binutils. It is used
  automatically by both the libiconv and OGDI recipes.
- Perl suitable for the OpenSSL build, Tcl (`tclsh.exe`) for SQLite source
  generation when `GDAL_SQLITE` is selected, Java JDK 8 and Apache Ant for Java
  bindings, and .NET 8 SDK for GDAL C# applications.
- WiX Toolset 3.x under `wix`, or override `WIX_DIR`; NuGet CLI on `PATH` for
  the retained NuGet packaging path.

The legacy local support inputs `regex-0.12`, `minizip`, `gdal`, `gperf`,
`pkg-config`, `pdiff`, and `diffutils` are provisioned below `support` on the
build host. They are ignored by Git but included by the source-archive manifest
when present.

CMake, Ninja, WinFlexBison, pkg-config-lite, and SWIG are pinned and prepared by
the Makefile. Administrator-managed executable paths may override their
download targets as documented in the root README.

## Proprietary and externally provisioned SDKs

The default feature set requires licensed or separately distributed inputs:

- ERDAS ECW JPEG 2000 SDK 5.5, selected by `ECWSDK_DIR` and
  `ECWSDK_VERSION`.
- Esri FileGDB API 1.5.1, selected by `FILEGDB_API_DIR`.
- Oracle Instant Client SDK, selected by `OCI_DIR` and the architecture-specific
  `INSTANTCLIENT_DIR` derived by the Makefile.
- MrSID DSDK under `support\mrsid`, or another locally configured location.
  `detect_mrsid.opt` deliberately stops parsing when MrSID is enabled but the
  selected SDK layout is missing.

These SDKs are not downloaded or included in source archives. Confirm their
licences permit the intended binaries to be redistributed. A host without one
of them must either provision it before invoking NMake or disable the matching
feature locally.

## Signing, publication, and service accounts

Production signing uses `cert\sign.bat` and `cert\signdir.bat`, the Windows SDK
`signtool`, a certificate accessible to the scheduled-task account, and the
configured timestamp service. FTP publication uses `uploadftp.bat`,
`uploadftpdir.bat`, and locally provisioned credentials. NuGet publication
requires `NUGET_GDAL_API_KEY` or the existing secure machine/user
configuration.

Never place private keys, API keys, passwords, or proxy credentials in this
repository. Validation runs must specify `NO_SIGN=YES NO_PUBLISH=YES` and a
staging `INSTALL_DIR`. Only re-enable signing and publication after inspecting
the complete artifact matrix.

## Build-host preparation checklist

1. Clone the `update3` branch into a non-production directory.
2. Provision both Visual Studio environments and both Python architectures.
3. Install Cygwin, Perl, Tcl, Java/Ant, .NET 8, WiX, 7-Zip, Git, and NuGet.
4. Provision the enabled commercial SDKs and configure local paths.
5. Run `support\audit-dependency-pins.ps1` and
   `support\archive-sources.ps1 -ValidateOnly`.
6. Run the clean x86/x64 VS2019/VS2022 build matrix with signing and publishing
   suppressed, then compare packages with production before cutover.

