@echo off
if "%1" == "setenv" goto setenv

%comspec% /k %~dp0\SDKShell.bat setenv %1
goto exit

:setenv
@echo Setting environment for using the GDAL and MapServer tools.

if "%2"=="hideoci" goto hideoci

set ocipath=0
set _path="%PATH:;=" "%"
for %%p in (%_path%) do if not "%%~p"=="" if exist %%~p\oci.dll set ocipath=1

if "%ocipath%"=="0" goto hideoci
@echo WARNING: If you encounter problems with missing oci libraries then type:
@echo   SDKShell hideoci
goto setenv2

:hideoci
@echo Hiding the OCI plugin library.
if not exist %~dp0\bin\gdal\plugins-optional mkdir %~dp0\bin\gdal\plugins-optional
if exist %~dp0\bin\gdal\plugins\ogr_OCI.dll move %~dp0\bin\gdal\plugins\ogr_OCI.dll %~dp0\bin\gdal\plugins-optional\ogr_OCI.dll
if exist %~dp0\bin\gdal\plugins\gdal_GEOR.dll move %~dp0\bin\gdal\plugins\gdal_GEOR.dll %~dp0\bin\gdal\plugins-optional\gdal_GEOR.dll

:setenv2
SET PATH=%~dp0\bin;%~dp0\bin\gdal\python\osgeo;%~dp0\bin\proj\apps;%~dp0\bin\gdal\apps;%~dp0\bin\ms\apps;%~dp0\bin\gdal\csharp;%~dp0\bin\ms\csharp;%~dp0\bin\curl;%PATH%
SET GDAL_DATA=%~dp0\bin\gdal-data
SET GDAL_DRIVER_PATH=%~dp0\bin\gdal\plugins
SET PYTHONPATH=%~dp0\bin\gdal\python\osgeo;%~dp0\bin\ms\python
SET PROJ_LIB=%~dp0\bin\proj\SHARE


:exit