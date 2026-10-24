@echo off
setlocal EnableExtensions EnableDelayedExpansion

set "ROOT=%~dp0"
set "ROOT=%ROOT:~0,-1%"
set "LOG_DIR=%ROOT%\doc\build-logs"
if not exist "%LOG_DIR%" mkdir "%LOG_DIR%"

set "SELECTOR=%~1"
if "%SELECTOR%"=="" set "SELECTOR=all"

if /I "%SELECTOR%"=="help" goto :help
if /I "%SELECTOR%"=="-h" goto :help
if /I "%SELECTOR%"=="--help" goto :help
if /I "%SELECTOR%"=="nmake" goto :nmake_entry

set "BUILD_MODE=%~2"
if /I "%BUILD_MODE%"=="nuget" if /I not "%SELECTOR%"=="vc16x64" (
    echo ERROR: The NuGet path is supported only with selector vc16x64.
    exit /b 2
)

call :prepare_log "%SELECTOR%" "%BUILD_MODE%"
call :run_selector
set "RC=!ERRORLEVEL!"
call :finish_log !RC!
exit /b !RC!

:run_selector
if /I "%SELECTOR%"=="all" (
    call :run_script makevc16.bat || exit /b !ERRORLEVEL!
    call :run_script makevc16x64.bat || exit /b !ERRORLEVEL!
    call :run_script makevc17.bat || exit /b !ERRORLEVEL!
    call :run_script makevc17x64.bat || exit /b !ERRORLEVEL!
    exit /b 0
)
if /I "%SELECTOR%"=="x86" (
    call :run_script makevc16.bat || exit /b !ERRORLEVEL!
    call :run_script makevc17.bat || exit /b !ERRORLEVEL!
    exit /b 0
)
if /I "%SELECTOR%"=="x64" (
    call :run_script makevc16x64.bat || exit /b !ERRORLEVEL!
    call :run_script makevc17x64.bat || exit /b !ERRORLEVEL!
    exit /b 0
)
if /I "%SELECTOR%"=="vs2019" (
    call :run_script makevc16.bat || exit /b !ERRORLEVEL!
    call :run_script makevc16x64.bat || exit /b !ERRORLEVEL!
    exit /b 0
)
if /I "%SELECTOR%"=="vs2022" (
    call :run_script makevc17.bat || exit /b !ERRORLEVEL!
    call :run_script makevc17x64.bat || exit /b !ERRORLEVEL!
    exit /b 0
)
if /I "%SELECTOR%"=="vc16" (
    call :run_script makevc16.bat
    exit /b !ERRORLEVEL!
)
if /I "%SELECTOR%"=="vc16x64" (
    call :run_script makevc16x64.bat
    exit /b !ERRORLEVEL!
)
if /I "%SELECTOR%"=="vc17" (
    call :run_script makevc17.bat
    exit /b !ERRORLEVEL!
)
if /I "%SELECTOR%"=="vc17x64" (
    call :run_script makevc17x64.bat
    exit /b !ERRORLEVEL!
)

echo ERROR: Unknown selector "%SELECTOR%".
exit /b 2

:run_script
set "SCRIPT=%~1"
echo [%DATE% %TIME%] START %SCRIPT% %BUILD_MODE%
echo START %SCRIPT% %BUILD_MODE%>>"%GIS_BUILD_SUMMARY%"
cd /d "%ROOT%"
call "%ROOT%\%SCRIPT%" %BUILD_MODE% >>"%GIS_BUILD_LOG%" 2>&1
set "RC=!ERRORLEVEL!"
if not "!RC!"=="0" (
    echo [%DATE% %TIME%] FAILED %SCRIPT% exit code !RC!
    echo FAILED %SCRIPT% exit code !RC!>>"%GIS_BUILD_SUMMARY%"
    exit /b !RC!
)
echo [%DATE% %TIME%] DONE %SCRIPT%
echo DONE %SCRIPT%>>"%GIS_BUILD_SUMMARY%"
exit /b 0

:nmake_entry
set "NMAKE_SELECTOR=%~2"
set "NMAKE_TARGET=%~3"
if "%NMAKE_SELECTOR%"=="" goto :usage
if "%NMAKE_TARGET%"=="" goto :usage
set "NMAKE_EXTRA="
shift
shift
shift
:collect_nmake_args
if "%~1"=="" goto :nmake_args_ready
if "%~2"=="" (
    echo ERROR: Missing value for nmake variable "%~1".
    exit /b 2
)
set "NMAKE_EXTRA=!NMAKE_EXTRA! %~1=%~2"
shift
shift
goto :collect_nmake_args

:nmake_args_ready
set "SELECTOR=nmake-%NMAKE_SELECTOR%"
set "BUILD_MODE=%NMAKE_TARGET%"
call :prepare_log "%SELECTOR%" "%BUILD_MODE%"
call :initialize_toolchain "%NMAKE_SELECTOR%"
if errorlevel 1 (
    set "RC=!ERRORLEVEL!"
    call :finish_log !RC!
    exit /b !RC!
)
echo [%DATE% %TIME%] START nmake %NMAKE_TARGET% %NMAKE_EXTRA%
echo START nmake %NMAKE_TARGET% %NMAKE_EXTRA%>>"%GIS_BUILD_SUMMARY%"
cd /d "%ROOT%"
cmd /d /c "nmake.exe %NMAKE_TARGET% %NMAKE_EXTRA%" >>"%GIS_BUILD_LOG%" 2>&1
set "RC=!ERRORLEVEL!"
if not "!RC!"=="0" echo FAILED nmake %NMAKE_TARGET% exit code !RC!>>"%GIS_BUILD_SUMMARY%"
if "!RC!"=="0" echo DONE nmake %NMAKE_TARGET%>>"%GIS_BUILD_SUMMARY%"
call :finish_log !RC!
exit /b !RC!

:initialize_toolchain
set "TOOLSET=%~1"
set "VCVARS="
set "ARCH_FLAG="
if /I "%TOOLSET%"=="vc16" set "VCVARS=%VCVARS_VC16%"
if /I "%TOOLSET%"=="vc16" if not defined VCVARS set "VCVARS=C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars32.bat"
if /I "%TOOLSET%"=="vc16x64" set "VCVARS=%VCVARS_VC16X64%"
if /I "%TOOLSET%"=="vc16x64" if not defined VCVARS set "VCVARS=C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars64.bat"
if /I "%TOOLSET%"=="vc16x64" set "ARCH_FLAG=WIN64=YES"
if /I "%TOOLSET%"=="vc17" set "VCVARS=%VCVARS_VC17%"
if /I "%TOOLSET%"=="vc17" if not defined VCVARS set "VCVARS=C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars32.bat"
if /I "%TOOLSET%"=="vc17x64" set "VCVARS=%VCVARS_VC17X64%"
if /I "%TOOLSET%"=="vc17x64" if not defined VCVARS set "VCVARS=C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars64.bat"
if /I "%TOOLSET%"=="vc17x64" set "ARCH_FLAG=WIN64=YES"
if not defined VCVARS (
    echo ERROR: Unknown nmake toolset "%TOOLSET%".
    echo ERROR unknown toolset %TOOLSET%>>"%GIS_BUILD_SUMMARY%"
    exit /b 2
)
if not exist "%VCVARS%" (
    echo ERROR: Visual Studio environment script not found: %VCVARS%
    echo ERROR Visual Studio environment script missing: %VCVARS%>>"%GIS_BUILD_SUMMARY%"
    exit /b 1
)
echo Initializing Visual Studio environment: %VCVARS%>>"%GIS_BUILD_LOG%"
echo Visual Studio environment output: %GIS_VCVARS_LOG%>>"%GIS_BUILD_LOG%"
call "%VCVARS%" >"%GIS_VCVARS_LOG%" 2>&1
if errorlevel 1 exit /b !ERRORLEVEL!
if defined ARCH_FLAG set "NMAKE_EXTRA=%NMAKE_EXTRA% %ARCH_FLAG%"
exit /b 0

:prepare_log
set "LOG_SELECTOR=%~1"
set "LOG_MODE=%~2"
if "%LOG_MODE%"=="" set "LOG_MODE=full"
for /f %%I in ('powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-Date -Format yyyyMMdd-HHmmss"') do set "STAMP=%%I"
set "LOG_ID=%LOG_SELECTOR%-%LOG_MODE%"
set "GIS_BUILD_LOG=%LOG_DIR%\build-%LOG_ID%-%STAMP%.log"
set "GIS_BUILD_SUMMARY=%LOG_DIR%\build-%LOG_ID%-%STAMP%-summary.txt"
set "GIS_VCVARS_LOG=%LOG_DIR%\build-%LOG_ID%-%STAMP%-vcvars.txt"
set "GIS_LATEST_LOG=%LOG_DIR%\build-%LOG_ID%-latest.log"
set "GIS_LATEST_SUMMARY=%LOG_DIR%\build-%LOG_ID%-latest-summary.txt"
echo Build started: %DATE% %TIME%>"%GIS_BUILD_LOG%"
echo Selector: %LOG_SELECTOR%>>"%GIS_BUILD_LOG%"
echo Mode/target: %LOG_MODE%>>"%GIS_BUILD_LOG%"
echo Build started: %DATE% %TIME%>"%GIS_BUILD_SUMMARY%"
echo Selector: %LOG_SELECTOR%>>"%GIS_BUILD_SUMMARY%"
echo Mode/target: %LOG_MODE%>>"%GIS_BUILD_SUMMARY%"
exit /b 0

:finish_log
set "FINAL_RC=%~1"
if "!FINAL_RC!"=="0" (
    echo SUCCESS>>"%GIS_BUILD_SUMMARY%"
    echo Build finished successfully: %DATE% %TIME%>>"%GIS_BUILD_LOG%"
) else (
    echo FAILED exit code !FINAL_RC!>>"%GIS_BUILD_SUMMARY%"
    echo Build failed with exit code !FINAL_RC!: %DATE% %TIME%>>"%GIS_BUILD_LOG%"
)
copy /Y "%GIS_BUILD_LOG%" "%GIS_LATEST_LOG%" >nul
copy /Y "%GIS_BUILD_SUMMARY%" "%GIS_LATEST_SUMMARY%" >nul
echo Log: %GIS_BUILD_LOG%
echo Summary: %GIS_BUILD_SUMMARY%
exit /b 0

:usage
echo Usage:
echo   build.bat [all^|x86^|x64^|vs2019^|vs2022^|vc16^|vc16x64^|vc17^|vc17x64] [dev^|stable^|rel^|osgeo4w^|mapmanager]
echo   build.bat vc16x64 nuget
echo   build.bat nmake ^<vc16^|vc16x64^|vc17^|vc17x64^> ^<target^> [NAME=VALUE ...]
echo.
echo With no arguments, all four scheduled compiler scripts run in makevc.bat order.
echo The wrapper adds local logs under doc\build-logs; existing dashboard logs remain active.
exit /b 2

:help
call :usage
exit /b 0
