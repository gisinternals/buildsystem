@SET VSINSTALLDIR=C:\Program Files (x86)\Microsoft Visual Studio 9.0
@SET VCINSTALLDIR=C:\Program Files (x86)\Microsoft Visual Studio 9.0\VC
@SET FrameworkDir=C:\Windows\Microsoft.NET\Framework64
@SET FrameworkVersion=v2.0.50727
@SET Framework35Version=v3.5
@if "%VSINSTALLDIR%"=="" goto error_no_VSINSTALLDIR
@if "%VCINSTALLDIR%"=="" goto error_no_VCINSTALLDIR

@echo Setting environment for using Microsoft Visual Studio 2008 Beta2 x64 tools.

@call :GetWindowsSdkDir

@if not "%WindowsSdkDir%" == "" (
	set "PATH=%WindowsSdkDir%bin\x64;%WindowsSdkDir%bin\win64\x64;%WindowsSdkDir%bin;%PATH%"
	set "INCLUDE=%WindowsSdkDir%include;%INCLUDE%"
	set "LIB=%WindowsSdkDir%lib\x64;%LIB%"
)

@set PATH=%VCINSTALLDIR%\BIN\amd64;%FrameworkDir%\%Framework35Version%;%FrameworkDir%\%Framework35Version%\Microsoft .NET Framework 3.5 (Pre-Release Version);%FrameworkDir%\%FrameworkVersion%;%VCINSTALLDIR%\VCPackages;%VSINSTALLDIR%\Common7\IDE;%VSINSTALLDIR%\Common7\Tools;%VSINSTALLDIR%\Common7\Tools\bin;%PATH%
@set INCLUDE=%VCINSTALLDIR%\ATLMFC\INCLUDE;%VCINSTALLDIR%\INCLUDE;%INCLUDE%
@set LIB=%VCINSTALLDIR%\ATLMFC\LIB\amd64;%VCINSTALLDIR%\LIB\amd64;%LIB%

@set LIBPATH=%FrameworkDir%\%Framework35Version%;%FrameworkDir%\%FrameworkVersion%;%FrameworkDir%\%Framework35Version%;%FrameworkDir%\%FrameworkVersion%;%VCINSTALLDIR%\ATLMFC\LIB\amd64;%VCINSTALLDIR%\LIB\amd64;%LIBPATH%

@goto end

:GetWindowsSdkDir
@call :GetWindowsSdkDirHelper HKLM > nul 2>&1
@if errorlevel 1 call :GetWindowsSdkDirHelper HKCU > nul 2>&1
@if errorlevel 1 echo WindowsSdkDir not found
@exit /B 0

:GetWindowsSdkDirHelper
@SET WindowsSdkDir=
@for /F "tokens=1,2*" %%i in ('reg query "%1\SOFTWARE\Microsoft\Microsoft SDKs\Windows" /v "CurrentInstallFolder"') DO (
	if "%%i"=="CurrentInstallFolder" (
		SET "WindowsSdkDir=%%k"
	)
)
@if "%WindowsSdkDir%"=="" exit /B 1
@exit /B 0

:error_no_VSINSTALLDIR
@echo ERROR: VSINSTALLDIR variable is not set. 
@goto end

:error_no_VCINSTALLDIR
@echo ERROR: VCINSTALLDIR variable is not set. 
@goto end

:end



set compiler=vc9x64

call setversions.bat

if "%1" == "stable" @goto stable
if "%1" == "rel" @goto rel

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

set logid=%compiler%-sdk

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

cmd /C makepackage.bat

:exit

