@echo Setting environment for using Microsoft Visual Studio 2012 x64 tools.


@call :GetVSCommonToolsDir
@if "%VS110COMNTOOLS%"=="" goto error_no_VS110COMNTOOLSDIR

@call "%VS110COMNTOOLS%VCVarsQueryRegistry.bat" No32bit 64bit

@if "%VSINSTALLDIR%"=="" goto error_no_VSINSTALLDIR
@if "%VCINSTALLDIR%"=="" goto error_no_VCINSTALLDIR
@if "%FrameworkDir64%"=="" goto error_no_FrameworkDIR64
@if "%FrameworkVersion64%"=="" goto error_no_FrameworkVer64
@if "%Framework35Version%"=="" goto error_no_Framework35Version

@set FrameworkDir=%FrameworkDir64%
@set FrameworkVersion=%FrameworkVersion64%

@if not "%WindowsSdkDir_old%" == "" (
	@set "PATH=%WindowsSdkDir_old%bin\NETFX 4.0 Tools\x64;%WindowsSdkDir_35%x64;%WindowsSdkDir_old%bin\NETFX 4.0 Tools;%WindowsSdkDir_35%;%PATH%"
)

@if not "%WindowsSdkDir%" == "" (
	@set "PATH=%WindowsSdkDir%bin\x64;%WindowsSdkDir%bin\x86;%PATH%"
	@set "INCLUDE=%WindowsSdkDir%include\shared;%WindowsSdkDir%include\um;%WindowsSdkDir%include\winrt;%INCLUDE%"
	@set "LIB=%WindowsSdkDir%lib\win8\um\x64;%LIB%"
	@set "LIBPATH=%WindowsSdkDir%References\CommonConfiguration\Neutral;%ExtensionSDKDir%\Microsoft.VCLibs\11.0\References\CommonConfiguration\neutral;%LIBPATH%"
)

@rem PATH
@rem ----
@if exist "%VSINSTALLDIR%Team Tools\Performance Tools\x64" (
	@set "PATH=%VSINSTALLDIR%Team Tools\Performance Tools\x64;%VSINSTALLDIR%Team Tools\Performance Tools;%PATH%"
)
@if exist "%ProgramFiles%\HTML Help Workshop" set PATH=%ProgramFiles%\HTML Help Workshop;%PATH%
@if exist "%ProgramFiles(x86)%\HTML Help Workshop" set PATH=%ProgramFiles(x86)%\HTML Help Workshop;%PATH%
@set PATH=%VSINSTALLDIR%Common7\Tools;%PATH%
@set PATH=%VSINSTALLDIR%Common7\IDE;%PATH%
@set PATH=%VCINSTALLDIR%VCPackages;%PATH%
@set PATH=%FrameworkDir%\%Framework35Version%;%PATH%
@set PATH=%FrameworkDir%\%FrameworkVersion%;%PATH%
@set PATH=%VCINSTALLDIR%BIN\amd64;%PATH%

@if exist "%VSINSTALLDIR%Common7\IDE\CommonExtensions\Microsoft\TestWindow" (
	@set "PATH=%VSINSTALLDIR%Common7\IDE\CommonExtensions\Microsoft\TestWindow;%PATH%"
)

@rem INCLUDE
@rem -------
@if exist "%VCINSTALLDIR%ATLMFC\INCLUDE" set INCLUDE=%VCINSTALLDIR%ATLMFC\INCLUDE;%INCLUDE%
@set INCLUDE=%VCINSTALLDIR%INCLUDE;%INCLUDE%
@set "INCLUDE=%INCLUDE%;C:\Program Files\Microsoft SDKs\Windows\v6.0A\include"

@rem LIB
@rem ---
@if exist "%VCINSTALLDIR%ATLMFC\LIB\amd64" set LIB=%VCINSTALLDIR%ATLMFC\LIB\amd64;%LIB%
@set LIB=%VCINSTALLDIR%LIB\amd64;%LIB%

@rem LIBPATH
@rem -------
@if exist "%VCINSTALLDIR%ATLMFC\LIB\amd64" set LIBPATH=%VCINSTALLDIR%ATLMFC\LIB\amd64;%LIBPATH%
@set LIBPATH=%VCINSTALLDIR%LIB\amd64;%LIBPATH%
@set LIBPATH=%FrameworkDir%\%Framework35Version%;%LIBPATH%
@set LIBPATH=%FrameworkDir%\%FrameworkVersion%;%LIBPATH%

@set Platform=X64
@set CommandPromptType=Native

@goto end

@REM -----------------------------------------------------------------------
:GetVSCommonToolsDir
@set VS110COMNTOOLS=
@call :GetVSCommonToolsDirHelper32 HKLM > nul 2>&1
@if errorlevel 1 call :GetVSCommonToolsDirHelper32 HKCU > nul 2>&1
@if errorlevel 1 call :GetVSCommonToolsDirHelper64  HKLM > nul 2>&1
@if errorlevel 1 call :GetVSCommonToolsDirHelper64  HKCU > nul 2>&1
@exit /B 0

:GetVSCommonToolsDirHelper32
@for /F "tokens=1,2*" %%i in ('reg query "%1\SOFTWARE\Microsoft\VisualStudio\SxS\VS7" /v "11.0"') DO (
	@if "%%i"=="11.0" (
		@SET "VS110COMNTOOLS=%%k"
	)
)
@if "%VS110COMNTOOLS%"=="" exit /B 1
@SET "VS110COMNTOOLS=%VS110COMNTOOLS%Common7\Tools\"
@exit /B 0

:GetVSCommonToolsDirHelper64
@for /F "tokens=1,2*" %%i in ('reg query "%1\SOFTWARE\Wow6432Node\Microsoft\VisualStudio\SxS\VS7" /v "11.0"') DO (
	@if "%%i"=="11.0" (
		@SET "VS110COMNTOOLS=%%k"
	)
)
@if "%VS110COMNTOOLS%"=="" exit /B 1
@SET "VS110COMNTOOLS=%VS110COMNTOOLS%Common7\Tools\"
@exit /B 0

@REM -----------------------------------------------------------------------
:error_no_VS110COMNTOOLSDIR
@echo ERROR: Cannot determine the location of the VS Common Tools folder.
@goto end

:error_no_VSINSTALLDIR
@echo ERROR: Cannot determine the location of the VS installation.
@goto end

:error_no_VCINSTALLDIR
@echo ERROR: Cannot determine the location of the VC installation.
@goto end

:error_no_FrameworkDIR64
@echo ERROR: Cannot determine the location of the .NET Framework 64bit installation.
@goto end

:error_no_FrameworkVer64
@echo ERROR: Cannot determine the version of the .NET Framework 64bit installation.
@goto end

:error_no_Framework35Version
@echo ERROR: Cannot determine the .NET Framework 3.5 version.
@goto end

:end





set compiler=vc11x64

set nmakecmd=full-rebuild
set logid=%compiler%-dev

nmake %nmakecmd% >%logid%.txt 2>%logid%-err.txt

