@echo off
@echo Setting environment for using the GDAL Utilities.
set SDK_ROOT=%~dp0
set SDK_ROOT=%SDK_ROOT:\\=\%
SET "PATH=%SDK_ROOT%;%PATH%"
SET "GDAL_DATA=%SDK_ROOT%gdal-data"
SET "GDAL_DRIVER_PATH=%SDK_ROOT%gdalplugins"
SET "PROJ_LIB=%SDK_ROOT%projlib"
SET "PYTHONPATH=%SDK_ROOT%python"
