@SET VSINSTALLDIR=C:\Program Files (x86)\Microsoft Visual Studio 8
@SET VCINSTALLDIR=C:\Program Files (x86)\Microsoft Visual Studio 8\VC
@SET FrameworkDir=C:\WINDOWS\Microsoft.NET\Framework64
@SET FrameworkVersion=v2.0.50727
@SET FrameworkSDKDir=C:\Program Files (x86)\Microsoft Visual Studio 8\SDK\v2.0 64bit
@if "%VSINSTALLDIR%"=="" goto error_no_VSINSTALLDIR
@if "%VCINSTALLDIR%"=="" goto error_no_VCINSTALLDIR

@echo Setting environment for using Microsoft Visual Studio 2005 x64 tools.

@set PATH=%VCINSTALLDIR%\BIN\amd64;%VCINSTALLDIR%\PlatformSDK\bin\win64\amd64;%VCINSTALLDIR%\PlatformSDK\bin;%FrameworkDir%\%FrameworkVersion%;%VCINSTALLDIR%\VCPackages;%VSINSTALLDIR%\Common7\IDE;%VSINSTALLDIR%\Common7\Tools;%VSINSTALLDIR%\Common7\Tools\bin;%VSINSTALLDIR%\SDK\v2.0\bin;%PATH%
@set INCLUDE=%VCINSTALLDIR%\ATLMFC\INCLUDE;%VCINSTALLDIR%\INCLUDE;%VCINSTALLDIR%\PlatformSDK\include;%VSINSTALLDIR%\SDK\v2.0\include;%INCLUDE%
@set LIB=%VCINSTALLDIR%\ATLMFC\LIB\amd64;%VCINSTALLDIR%\LIB\amd64;%VCINSTALLDIR%\PlatformSDK\lib\amd64;%VSINSTALLDIR%\SDK\v2.0\LIB\AMD64;%LIB%

@set LIBPATH=%VCINSTALLDIR%\ATLMFC\LIB\amd64;%LIBPATH%

@goto end

:error_no_VSINSTALLDIR
@echo ERROR: VSINSTALLDIR variable is not set. 
@goto end

:error_no_VCINSTALLDIR
@echo ERROR: VCINSTALLDIR variable is not set. 
@goto end

:end



set compiler=vc8x64

set nmakecmd=full-rebuild
set logid=%compiler%-dev

nmake %nmakecmd% >%logid%.txt 2>%logid%-err.txt
