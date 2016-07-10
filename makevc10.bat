@echo Setting environment for using Microsoft Visual Studio 2010 x86 tools.

@call :GetVSCommonToolsDir
@if "%VS100COMNTOOLS%"=="" goto error_no_VS100COMNTOOLSDIR

@call "%VS100COMNTOOLS%VCVarsQueryRegistry.bat" 32bit No64bit

@if "%VSINSTALLDIR%"=="" goto error_no_VSINSTALLDIR
@if "%FrameworkDir32%"=="" goto error_no_FrameworkDIR32
@if "%FrameworkVersion32%"=="" goto error_no_FrameworkVer32
@if "%Framework35Version%"=="" goto error_no_Framework35Version

@set FrameworkDir=%FrameworkDir32%
@set FrameworkVersion=%FrameworkVersion32%

@if not "%WindowsSdkDir%" == "" (
	@set "PATH=%WindowsSdkDir%bin\NETFX 4.0 Tools;%WindowsSdkDir%bin;%PATH%"
	@set "INCLUDE=%WindowsSdkDir%include;%INCLUDE%"
	@set "LIB=%WindowsSdkDir%lib;%LIB%"
)

@rem
@rem Root of Visual Studio IDE installed files.
@rem
@set DevEnvDir=%VSINSTALLDIR%Common7\IDE\

@rem PATH
@rem ----
@if exist "%VSINSTALLDIR%Team Tools\Performance Tools" (
	@set "PATH=%VSINSTALLDIR%Team Tools\Performance Tools;%PATH%"
)
@if exist "%ProgramFiles%\HTML Help Workshop" set PATH=%ProgramFiles%\HTML Help Workshop;%PATH%
@if exist "%ProgramFiles(x86)%\HTML Help Workshop" set PATH=%ProgramFiles(x86)%\HTML Help Workshop;%PATH%
@if exist "%VCINSTALLDIR%VCPackages" set PATH=%VCINSTALLDIR%VCPackages;%PATH%
@set PATH=%FrameworkDir%%Framework35Version%;%PATH%
@set PATH=%FrameworkDir%%FrameworkVersion%;%PATH%
@set PATH=%VSINSTALLDIR%Common7\Tools;%PATH%
@if exist "%VCINSTALLDIR%BIN" set PATH=%VCINSTALLDIR%BIN;%PATH%
@set PATH=%DevEnvDir%;%PATH%

@if exist "%VSINSTALLDIR%VSTSDB\Deploy" (
	@set "PATH=%VSINSTALLDIR%VSTSDB\Deploy;%PATH%"
)

@if not "%FSHARPINSTALLDIR%" == "" (
	@set "PATH=%FSHARPINSTALLDIR%;%PATH%"
)

@rem INCLUDE
@rem -------
@if exist "%VCINSTALLDIR%ATLMFC\INCLUDE" set INCLUDE=%VCINSTALLDIR%ATLMFC\INCLUDE;%INCLUDE%
@if exist "%VCINSTALLDIR%INCLUDE" set INCLUDE=%VCINSTALLDIR%INCLUDE;%INCLUDE%

@rem LIB
@rem ---
@if exist "%VCINSTALLDIR%ATLMFC\LIB" set LIB=%VCINSTALLDIR%ATLMFC\LIB;%LIB%
@if exist "%VCINSTALLDIR%LIB" set LIB=%VCINSTALLDIR%LIB;%LIB%

@rem LIBPATH
@rem -------
@if exist "%VCINSTALLDIR%ATLMFC\LIB" set LIBPATH=%VCINSTALLDIR%ATLMFC\LIB;%LIBPATH%
@if exist "%VCINSTALLDIR%LIB" set LIBPATH=%VCINSTALLDIR%LIB;%LIBPATH%
@set LIBPATH=%FrameworkDir%%Framework35Version%;%LIBPATH%
@set LIBPATH=%FrameworkDir%%FrameworkVersion%;%LIBPATH%

@goto end

@REM -----------------------------------------------------------------------
:GetVSCommonToolsDir
@set VS100COMNTOOLS=
@call :GetVSCommonToolsDirHelper32 HKLM > nul 2>&1
@if errorlevel 1 call :GetVSCommonToolsDirHelper32 HKCU > nul 2>&1
@if errorlevel 1 call :GetVSCommonToolsDirHelper64  HKLM > nul 2>&1
@if errorlevel 1 call :GetVSCommonToolsDirHelper64  HKCU > nul 2>&1
@exit /B 0

:GetVSCommonToolsDirHelper32
@for /F "tokens=1,2*" %%i in ('reg query "%1\SOFTWARE\Microsoft\VisualStudio\SxS\VS7" /v "10.0"') DO (
	@if "%%i"=="10.0" (
		@SET "VS100COMNTOOLS=%%k"
	)
)
@if "%VS100COMNTOOLS%"=="" exit /B 1
@SET "VS100COMNTOOLS=%VS100COMNTOOLS%Common7\Tools\"
@exit /B 0

:GetVSCommonToolsDirHelper64
@for /F "tokens=1,2*" %%i in ('reg query "%1\SOFTWARE\Wow6432Node\Microsoft\VisualStudio\SxS\VS7" /v "10.0"') DO (
	@if "%%i"=="10.0" (
		@SET "VS100COMNTOOLS=%%k"
	)
)
@if "%VS100COMNTOOLS%"=="" exit /B 1
@SET "VS100COMNTOOLS=%VS100COMNTOOLS%Common7\Tools\"
@exit /B 0

@REM -----------------------------------------------------------------------
:error_no_VS100COMNTOOLSDIR
@echo ERROR: Cannot determine the location of the VS Common Tools folder.
@goto end

:error_no_VSINSTALLDIR
@echo ERROR: Cannot determine the location of the VS installation.
@goto end

:error_no_FrameworkDIR32
@echo ERROR: Cannot determine the location of the .NET Framework 32bit installation.
@goto end

:error_no_FrameworkVer32
@echo ERROR: Cannot determine the version of the .NET Framework 32bit installation.
@goto end

:error_no_Framework35Version
@echo ERROR: Cannot determine the .NET Framework 3.5 version.
@goto end

:end



set compiler=vc10

call setversions.bat

if "%1" == "stable" @goto stable
if "%1" == "rel" @goto rel
if "%1" == "osgeo4w" @goto osgeo4w
if "%1" == "mapmanager" @goto mapmanager

set logid=%compiler%-dev
set gdal-dir=gdal-trunk
set ms-dir=mapserver
set msautotest-dir=msautotest
set pkg-version=gdal-mapserver
set gdal-tag=%gdal_dev_tag%

cmd /C makepackage.bat

:stable

set logid=%compiler%-stable-%gdal_version%-%ms_version%
set gdal-dir=gdal-%gdal_version%
set ms-dir=mapserver-%ms_version%
set msautotest-dir=msautotest-%ms_version%
set pkg-version=gdal-%gdal_major%-%gdal_minor%-%ms-dir%
set gdal-tag=%gdal_stable_tag%

cmd /C makepackage.bat

:dev

set logid=%compiler%-sdk
set ms-dir=mapserver-%ms_version%

set nmakecmd=package-dev GDAL_DIR=..\sdk\%compiler%\%gdal-dir%\gdal MS_DIR=..\sdk\%compiler%\%ms-dir% INSTALL_DIR=C:\Inetpub\wwwroot\sdk\downloads
set cmdname=Packaging-dev
for /f "tokens=1-7 delims=:.,- " %%a in ("%date% %time%") do set id=%%a%%b%%c-%%d-%%e-%%f-%%g-%logid%
echo %date% %time%: %cmdname% started ^&nbsp^<a href="http://build.gisinternals.com/sdk/build-output/%compiler%-%id%.txt"^>stdout^</a^>^&nbsp^<a href="http://build.gisinternals.com/sdk/build-output/%compiler%-%id%-err.txt"^>stderr^</a^>^&nbsp >>C:\Inetpub\wwwroot\sdk\build-output\%logid%.html
nmake %nmakecmd% >C:\Inetpub\wwwroot\sdk\build-output\%compiler%-%id%.txt 2>C:\Inetpub\wwwroot\sdk\build-output\%compiler%-%id%-err.txt
IF ERRORLEVEL 1 (
echo ^<span style="background-color:Red;color:Black;font-weight:bold"^>%cmdname% Failed^</span^> >C:\Inetpub\wwwroot\sdk\build-output\status-%logid%.html
echo ^<span style="background-color:Red;color:Black;font-weight:bold"^>Failed^</span^>^<br/^> >>C:\Inetpub\wwwroot\sdk\build-output\%logid%.html
@goto exit
) else (
echo ^<span style="background-color:Lime;color:Black;font-weight:bold"^>%cmdname% OK^</span^> >C:\Inetpub\wwwroot\sdk\build-output\status-%logid%.html
echo ^<span style="background-color:Lime;color:Black;font-weight:bold"^>Success^</span^>^<br/^> >>C:\Inetpub\wwwroot\sdk\build-output\%logid%.html
)

echo ^<span style="background-color:Lime;color:Black;font-weight:bold"^>finished at %date% %time%^</span^> >C:\Inetpub\wwwroot\sdk\build-output\status-%logid%.html

echo ^<hr/^> >>C:\Inetpub\wwwroot\sdk\build-output\%logid%.html

:osgeo4w
set logid=%compiler%-osgeo4w-stable-dev
set ms-dir=mapserver-%ms_version%
if exist ms-osgeo4w-build.txt set /p buildnumber=<ms-osgeo4w-build.txt
if not exist ms-osgeo4w-build.txt set buildnumber=1
set /A buildnumber+=1
echo %buildnumber% >ms-osgeo4w-build.txt
echo @echo off >E:\builds\rsync\uploadx86.bat

set ms-osgeo4w-ver=%ms_osgeo4w_version%
set ms-osgeo4w-pkg=-stable-dev

set pkg-version=gdal-%gdal_major%-%gdal_minor%-%ms-dir%

rem cmd /C makeosgeo4w.bat

set logid=%compiler%-osgeo4w-dev
set ms-osgeo4w-ver=%ms_osgeo4w_version_dev%
set ms-osgeo4w-pkg=-dev
set ms-dir=mapserver

rem cmd /C makeosgeo4w.bat

:mapmanager
set gdal-dir=gdal-%gdal_version%
set ms-dir=mapserver-%ms_version%
set msautotest-dir=msautotest-%ms_version%
set pkg-version=gdal-%gdal_major%-%gdal_minor%-%ms-dir%
set gdal-tag=%gdal_stable_tag%
set logid=%compiler%-mapmanager-stable-dev
cmd /C makemapmanager.bat

@goto exit

:upload

set nmakecmd=upload-osgeo
set cmdname=Uploading-osgeo4w
for /f "tokens=1-7 delims=:.,- " %%a in ("%date% %time%") do set id=%%a%%b%%c-%%d-%%e-%%f-%%g-%logid%
echo %date% %time%: %cmdname% started ^&nbsp^<a href="http://build.gisinternals.com/sdk/build-output/%compiler%-%id%.txt"^>stdout^</a^>^&nbsp^<a href="http://build.gisinternals.com/sdk/build-output/%compiler%-%id%-err.txt"^>stderr^</a^>^&nbsp >>C:\Inetpub\wwwroot\sdk\build-output\%logid%.html
nmake %nmakecmd% >C:\Inetpub\wwwroot\sdk\build-output\%compiler%-%id%.txt 2>C:\Inetpub\wwwroot\sdk\build-output\%compiler%-%id%-err.txt
IF ERRORLEVEL 1 (
echo ^<span style="background-color:Red;color:Black;font-weight:bold"^>%cmdname% Failed^</span^> >C:\Inetpub\wwwroot\sdk\build-output\status-%logid%.html
echo ^<span style="background-color:Red;color:Black;font-weight:bold"^>Failed^</span^>^<br/^> >>C:\Inetpub\wwwroot\sdk\build-output\%logid%.html
@goto exit
) else (
echo ^<span style="background-color:Lime;color:Black;font-weight:bold"^>%cmdname% OK^</span^> >C:\Inetpub\wwwroot\sdk\build-output\status-%logid%.html
echo ^<span style="background-color:Lime;color:Black;font-weight:bold"^>Success^</span^>^<br/^> >>C:\Inetpub\wwwroot\sdk\build-output\%logid%.html
)

echo ^<span style="background-color:Lime;color:Black;font-weight:bold"^>finished at %date% %time%^</span^> >C:\Inetpub\wwwroot\sdk\build-output\status-%logid%.html

echo ^<hr/^> >>C:\Inetpub\wwwroot\sdk\build-output\%logid%.html

@goto exit

:rel

set logid=%compiler%-released-%gdal_version%-%ms_version%
set gdal-dir=gdal-%gdal_version%
set ms-dir=mapserver-%ms_version%
set msautotest-dir=msautotest-%ms_version%
set pkg-version=gdal-%gdal_major%-%gdal_minor%-%gdal_rel%-mapserver-%ms_version%-%ms_rel%
set MS_REVISION=%ms_rev%
set GDAL_REVISION=%gdal_rev%
set gdal-tag=%gdal_stable_tag%

rem cmd /C makepackage.bat

set logid=%compiler%-osgeo4w-release
set buildnumber=1
echo @echo off >E:\builds\rsync\uploadx86.bat

set ms-osgeo4w-ver=%ms_osgeo4w_version%
set ms-osgeo4w-pkg=

rem cmd /C makeosgeo4w.bat

set logid=%compiler%-mapmanager-ms-%ms_version%
cmd /C makemapmanager.bat

:exit

