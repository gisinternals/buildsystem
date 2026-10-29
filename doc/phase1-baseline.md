# Phase 1 baseline

Captured: 2026-10-24 20:30:20 +02:00

Git commit: `f5ce79bcb069e04d3ff10201247eff2937603362`

## Build readiness

| Check | Result |
|---|---|
| Tool `git` | `C:\Program Files\Git\cmd\git.exe` |
| Tool `7z` | `C:\Program Files\7-Zip\7z.exe` |
| Tool `nmake` | not on PATH |
| Tool `cl` | not on PATH |
| Tool `nuget` | not on PATH |
| Tool `dotnet` | `C:\Program Files\dotnet\dotnet.exe` |
| Tool `powershell` | `C:\WINDOWS\System32\WindowsPowerShell\v1.0\powershell.exe` |
| `C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars32.bat` | present |
| `C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars64.bat` | present |
| `C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars32.bat` | present |
| `C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars64.bat` | present |
| Existing `release-*` output directories | 0 |
| Existing package artifacts | 0 |

The four scheduled builds and NuGet baseline were not executed: No release-* baseline exists, NuGet is not on PATH, and package targets contain live signing/FTP publication commands. Add staging/no-publish controls before executing the scheduled pipeline as validation.

## Version ownership findings

The machine-readable report records every repeated version-like assignment. The principal ownership decisions are:

- `setversions.bat` owns GDAL, MapServer, and MapCache stable/release selections used by compiler entry points.
- `config.opt` owns third-party dependency source pins and fallback application branches.
- Makefile values should be defaults only. `SWIG_VER` currently has a Makefile default while `makepackage-cmake.bat` repeats it on commands; Phase 2 should centralize this pin.
- NuGet uses `gdal-release-ver` derived by `setversions.bat`; nuspec binary paths separately encode compiler output directories and require review when toolsets change.

## Publication safeguard finding

The existing `package`, `package-libs`, `package-dev`, and related targets call signing and FTP upload commands directly. Baseline validation needs a `NO_SIGN`/`NO_PUBLISH` or staging equivalent before those targets can be safely exercised outside the production scheduled task.

See `phase1-baseline.json` for tool paths, all discovered artifacts, duplicate definitions, and exact publication call sites.
