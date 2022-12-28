@echo Setting environment for using Microsoft Visual Studio 2022 x86 tools.

call "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars32.bat"
E:

set compiler=vc17

call setversions.bat

if "%1" == "stable" @goto stable
if "%1" == "rel" @goto rel
if "%1" == "osgeo4w" @goto osgeo4w
if "%1" == "mapmanager" @goto mapmanager

set logid=%compiler%-dev
set gdal-dir=gdal
set ms-dir=mapserver
set msautotest-dir=msautotest
set pkg-version=gdal-mapserver
set MAPSERVER_BRANCH=main
set MAPCACHE_BRANCH=main
set GDAL_BRANCH=master
set gdal-tag=%gdal_dev_tag%

cmd /C makepackage-cmake.bat

if "%1" == "dev" @goto exit

:stable

set logid=%compiler%-stable-%gdal_version%-%ms_version%
set gdal-dir=gdal-%gdal_version%
set ms-dir=mapserver-%ms_version%
set msautotest-dir=msautotest-%ms_version%
set pkg-version=gdal-%gdal_major%-%gdal_minor%-%ms-dir%
set MAPSERVER_BRANCH=branch-%ms_version%
set MAPCACHE_BRANCH=branch-%mapcache_major%-%mapcache_minor%
set GDAL_BRANCH=release/%gdal_major%.%gdal_minor%
set gdal-tag=%gdal_stable_tag%

cmd /C makepackage.bat

:dev

set logid=%compiler%-sdk
set ms-dir=mapserver-%ms_version%

set nmakecmd=package-dev INSTALL_DIR=C:\Inetpub\wwwroot\sdk\downloads
set cmdname=Packaging-dev
for /f "tokens=1-7 delims=:.,- " %%a in ("%date% %time%") do set id=%%a%%b%%c-%%d-%%e-%%f-%%g-%logid%
echo %date% %time%: %cmdname% started ^&nbsp^<a href="%compiler%-%id%.txt"^>stdout^</a^>^&nbsp^<a href="%compiler%-%id%-err.txt"^>stderr^</a^>^&nbsp >>C:\Inetpub\wwwroot\sdk\build-output\%logid%.html
nmake %nmakecmd% >C:\Inetpub\wwwroot\sdk\build-output\%compiler%-%id%.txt 2>C:\Inetpub\wwwroot\sdk\build-output\%compiler%-%id%-err.txt
IF ERRORLEVEL 1 (
echo ^<span style="background-color:Red;color:Black;font-weight:bold"^>%cmdname% Failed^</span^> >C:\Inetpub\wwwroot\sdk\build-output\status-%logid%.html
echo ^<span style="background-color:Red;color:Black;font-weight:bold"^>Failed^</span^>^<br/^> >>C:\Inetpub\wwwroot\sdk\build-output\%logid%.html
@goto exit
) else (
echo ^<span style="background-color:Lime;color:Black;font-weight:bold"^>%cmdname% OK^</span^> >C:\Inetpub\wwwroot\sdk\build-output\status-%logid%.html
echo ^<span style="background-color:Lime;color:Black;font-weight:bold"^>Success^</span^>^<br/^> >>C:\Inetpub\wwwroot\sdk\build-output\%logid%.html
)

echo ^<span style="background-color:Lime;color:Black;font-weight:bold"^>finished on %date% %time%^</span^> >C:\Inetpub\wwwroot\sdk\build-output\status-%logid%.html

echo ^<hr/^> >>C:\Inetpub\wwwroot\sdk\build-output\%logid%.html

:mapmanager
set gdal-dir=gdal-%gdal_version%
set ms-dir=mapserver-%ms_version%
set msautotest-dir=msautotest-%ms_version%
set pkg-version=gdal-%gdal_major%-%gdal_minor%-%ms-dir%
set gdal-tag=%gdal_stable_tag%
set logid=%compiler%-mapmanager-stable-dev
set MAPSERVER_BRANCH=branch-%ms_version%
set GDAL_BRANCH=release/%gdal_major%.%gdal_minor%
set MAPMANAGER_BRANCH=mapserver-%ms_version%
rem cmd /C makemapmanager.bat

@goto exit

:rel

set logid=%compiler%-released-%gdal_version%-%ms_version%%variant%
set gdal-dir=gdal-%gdal_version%
set ms-dir=mapserver-%ms_version%
set msautotest-dir=msautotest-%ms_version%
set pkg-version=gdal-%gdal_major%-%gdal_minor%-%gdal_rel%-mapserver-%ms_version%-%ms_rel%%variant%
set MAPSERVER_BRANCH=rel-%ms_version%-%ms_rel%
set MAPCACHE_BRANCH=rel-%mapcache_major%-%mapcache_minor%-%mapcache_rel%
set GDAL_BRANCH=v%gdal_major%.%gdal_minor%.%gdal_rel%
set MAPMANAGER_BRANCH=mapserver-%ms_version%
set gdal-tag=%gdal_stable_tag%

echo %pkg-version%

cmd /C makepackage.bat

set logid=%compiler%-mapmanager-ms-%ms_version%
rem cmd /C makemapmanager.bat


:exit

