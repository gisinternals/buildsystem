set baseurl=

set nmakecmd=update
set cmdname=Update
for /f "tokens=1-7 delims=:.,- " %%a in ("%date% %time%") do set id=%%a%%b%%c-%%d-%%e-%%f-%%g-%logid%
echo %date% %time%: %cmdname% started ^&nbsp^<a href="%baseurl%%compiler%-%id%.txt"^>stdout^</a^>^&nbsp^<a href="%baseurl%%compiler%-%id%-err.txt"^>stderr^</a^>^&nbsp >>C:\Inetpub\wwwroot\sdk\build-output\%logid%.html
echo ^<span style="background-color:Yellow;color:Black;font-weight:bold"^>%cmdname%^</span^> >C:\Inetpub\wwwroot\sdk\build-output\status-%logid%.html
nmake %nmakecmd% >C:\Inetpub\wwwroot\sdk\build-output\%compiler%-%id%.txt 2>C:\Inetpub\wwwroot\sdk\build-output\%compiler%-%id%-err.txt
IF ERRORLEVEL 1 (
echo ^<span style="background-color:Red;color:Black;font-weight:bold"^>%cmdname% Failed^</span^> >C:\Inetpub\wwwroot\sdk\build-output\status-%logid%.html
echo ^<span style="background-color:Red;color:Black;font-weight:bold"^>Failed^</span^>^<br/^> >>C:\Inetpub\wwwroot\sdk\build-output\%logid%.html
@goto exit
) else (
echo ^<span style="background-color:Lime;color:Black;font-weight:bold"^>%cmdname% OK^</span^> >C:\Inetpub\wwwroot\sdk\build-output\status-%logid%.html
echo ^<span style="background-color:Lime;color:Black;font-weight:bold"^>Success^</span^>^<br/^> >>C:\Inetpub\wwwroot\sdk\build-output\%logid%.html
)

set nmakecmd=rebuild-gdal-cmake SWIG_VER=4.0.2
set cmdname=GDAL build
for /f "tokens=1-7 delims=:.,- " %%a in ("%date% %time%") do set id=%%a%%b%%c-%%d-%%e-%%f-%%g-%logid%
echo %date% %time%: %cmdname% started ^&nbsp^<a href="%baseurl%%compiler%-%id%.txt"^>stdout^</a^>^&nbsp^<a href="%baseurl%%compiler%-%id%-err.txt"^>stderr^</a^>^&nbsp >>C:\Inetpub\wwwroot\sdk\build-output\%logid%.html
echo ^<span style="background-color:Yellow;color:Black;font-weight:bold"^>%cmdname%^</span^> >C:\Inetpub\wwwroot\sdk\build-output\status-%logid%.html
nmake %nmakecmd% >C:\Inetpub\wwwroot\sdk\build-output\%compiler%-%id%.txt 2>C:\Inetpub\wwwroot\sdk\build-output\%compiler%-%id%-err.txt
IF ERRORLEVEL 1 (
echo ^<span style="background-color:Red;color:Black;font-weight:bold"^>%cmdname% Failed^</span^> >C:\Inetpub\wwwroot\sdk\build-output\status-%logid%.html
echo ^<span style="background-color:Red;color:Black;font-weight:bold"^>Failed^</span^>^<br/^> >>C:\Inetpub\wwwroot\sdk\build-output\%logid%.html
@goto exit
) else (
echo ^<span style="background-color:Lime;color:Black;font-weight:bold"^>%cmdname% OK^</span^> >C:\Inetpub\wwwroot\sdk\build-output\status-%logid%.html
echo ^<span style="background-color:Lime;color:Black;font-weight:bold"^>Success^</span^>^<br/^> >>C:\Inetpub\wwwroot\sdk\build-output\%logid%.html
)

set nmakecmd=op-disable
set cmdname=GDAL csharp test
for /f "tokens=1-7 delims=:.,- " %%a in ("%date% %time%") do set id=%%a%%b%%c-%%d-%%e-%%f-%%g-%logid%
echo %date% %time%: %cmdname% started ^&nbsp^<a href="%baseurl%%compiler%-%id%.txt"^>stdout^</a^>^&nbsp^<a href="%baseurl%%compiler%-%id%-err.txt"^>stderr^</a^>^&nbsp >>C:\Inetpub\wwwroot\sdk\build-output\%logid%.html
echo ^<span style="background-color:Yellow;color:Black;font-weight:bold"^>%cmdname%^</span^> >C:\Inetpub\wwwroot\sdk\build-output\status-%logid%.html
nmake %nmakecmd% >C:\Inetpub\wwwroot\sdk\build-output\%compiler%-%id%.txt 2>C:\Inetpub\wwwroot\sdk\build-output\%compiler%-%id%-err.txt
IF ERRORLEVEL 1 (
echo ^<span style="background-color:Red;color:Black;font-weight:bold"^>%cmdname% Failed^</span^> >C:\Inetpub\wwwroot\sdk\build-output\status-%logid%.html
echo ^<span style="background-color:Red;color:Black;font-weight:bold"^>Failed^</span^>^<br/^> >>C:\Inetpub\wwwroot\sdk\build-output\%logid%.html
) else (
echo ^<span style="background-color:Lime;color:Black;font-weight:bold"^>%cmdname% OK^</span^> >C:\Inetpub\wwwroot\sdk\build-output\status-%logid%.html
echo ^<span style="background-color:Lime;color:Black;font-weight:bold"^>Success^</span^>^<br/^> >>C:\Inetpub\wwwroot\sdk\build-output\%logid%.html
)

set nmakecmd=gdal-python-cmake-all SWIG_VER=4.0.2
set cmdname=GDAL python build
for /f "tokens=1-7 delims=:.,- " %%a in ("%date% %time%") do set id=%%a%%b%%c-%%d-%%e-%%f-%%g-%logid%
echo %date% %time%: %cmdname% started ^&nbsp^<a href="%baseurl%%compiler%-%id%.txt"^>stdout^</a^>^&nbsp^<a href="%baseurl%%compiler%-%id%-err.txt"^>stderr^</a^>^&nbsp >>C:\Inetpub\wwwroot\sdk\build-output\%logid%.html
echo ^<span style="background-color:Yellow;color:Black;font-weight:bold"^>%cmdname%^</span^> >C:\Inetpub\wwwroot\sdk\build-output\status-%logid%.html
nmake %nmakecmd% >C:\Inetpub\wwwroot\sdk\build-output\%compiler%-%id%.txt 2>C:\Inetpub\wwwroot\sdk\build-output\%compiler%-%id%-err.txt
IF ERRORLEVEL 1 (
echo ^<span style="background-color:Red;color:Black;font-weight:bold"^>%cmdname% Failed^</span^> >C:\Inetpub\wwwroot\sdk\build-output\status-%logid%.html
echo ^<span style="background-color:Red;color:Black;font-weight:bold"^>Failed^</span^>^<br/^> >>C:\Inetpub\wwwroot\sdk\build-output\%logid%.html
@goto exit
) else (
echo ^<span style="background-color:Lime;color:Black;font-weight:bold"^>%cmdname% OK^</span^> >C:\Inetpub\wwwroot\sdk\build-output\status-%logid%.html
echo ^<span style="background-color:Lime;color:Black;font-weight:bold"^>Success^</span^>^<br/^> >>C:\Inetpub\wwwroot\sdk\build-output\%logid%.html
)

set nmakecmd=gdalversion
set cmdname=GDALVersion
for /f "tokens=1-7 delims=:.,- " %%a in ("%date% %time%") do set id=%%a%%b%%c-%%d-%%e-%%f-%%g-%logid%
echo %date% %time%: %cmdname% started ^&nbsp^<a href="%baseurl%%compiler%-%id%.txt"^>stdout^</a^>^&nbsp^<a href="%baseurl%%compiler%-%id%-err.txt"^>stderr^</a^>^&nbsp >>C:\Inetpub\wwwroot\sdk\build-output\%logid%.html
echo ^<span style="background-color:Yellow;color:Black;font-weight:bold"^>%cmdname%^</span^> >C:\Inetpub\wwwroot\sdk\build-output\status-%logid%.html
nmake %nmakecmd% >C:\Inetpub\wwwroot\sdk\build-output\%compiler%-%id%.txt 2>C:\Inetpub\wwwroot\sdk\build-output\%compiler%-%id%-err.txt
IF ERRORLEVEL 1 (
echo ^<span style="background-color:Red;color:Black;font-weight:bold"^>%cmdname% Failed^</span^> >C:\Inetpub\wwwroot\sdk\build-output\status-%logid%.html
echo ^<span style="background-color:Red;color:Black;font-weight:bold"^>Failed^</span^>^<br/^> >>C:\Inetpub\wwwroot\sdk\build-output\%logid%.html
) else (
echo ^<span style="background-color:Lime;color:Black;font-weight:bold"^>%cmdname% OK^</span^> >C:\Inetpub\wwwroot\sdk\build-output\status-%logid%.html
echo ^<span style="background-color:Lime;color:Black;font-weight:bold"^>Success^</span^>^<br/^> >>C:\Inetpub\wwwroot\sdk\build-output\%logid%.html
)

set nmakecmd=gdal-autotest
set cmdname=GDAL autotest
for /f "tokens=1-7 delims=:.,- " %%a in ("%date% %time%") do set id=%%a%%b%%c-%%d-%%e-%%f-%%g-%logid%
echo %date% %time%: %cmdname% started ^&nbsp^<a href="%baseurl%%compiler%-%id%.txt"^>stdout^</a^>^&nbsp^<a href="%baseurl%%compiler%-%id%-err.txt"^>stderr^</a^>^&nbsp >>C:\Inetpub\wwwroot\sdk\build-output\%logid%.html
echo ^<span style="background-color:Yellow;color:Black;font-weight:bold"^>%cmdname%^</span^> >C:\Inetpub\wwwroot\sdk\build-output\status-%logid%.html
nmake %nmakecmd% >C:\Inetpub\wwwroot\sdk\build-output\%compiler%-%id%.txt 2>C:\Inetpub\wwwroot\sdk\build-output\%compiler%-%id%-err.txt
IF ERRORLEVEL 1 (
echo ^<span style="background-color:Red;color:Black;font-weight:bold"^>%cmdname% Failed^</span^> >C:\Inetpub\wwwroot\sdk\build-output\status-%logid%.html
echo ^<span style="background-color:Red;color:Black;font-weight:bold"^>Failed^</span^>^<br/^> >>C:\Inetpub\wwwroot\sdk\build-output\%logid%.html
@goto exit
) else (
echo ^<span style="background-color:Lime;color:Black;font-weight:bold"^>%cmdname% OK^</span^> >C:\Inetpub\wwwroot\sdk\build-output\status-%logid%.html
echo ^<span style="background-color:Lime;color:Black;font-weight:bold"^>Success^</span^>^<br/^> >>C:\Inetpub\wwwroot\sdk\build-output\%logid%.html
)

set nmakecmd=mkgdalinst
set cmdname=GDAL installer
for /f "tokens=1-7 delims=:.,- " %%a in ("%date% %time%") do set id=%%a%%b%%c-%%d-%%e-%%f-%%g-%logid%
echo %date% %time%: %cmdname% started ^&nbsp^<a href="%baseurl%%compiler%-%id%.txt"^>stdout^</a^>^&nbsp^<a href="%baseurl%%compiler%-%id%-err.txt"^>stderr^</a^>^&nbsp >>C:\Inetpub\wwwroot\sdk\build-output\%logid%.html
echo ^<span style="background-color:Yellow;color:Black;font-weight:bold"^>%cmdname%^</span^> >C:\Inetpub\wwwroot\sdk\build-output\status-%logid%.html
nmake %nmakecmd% >C:\Inetpub\wwwroot\sdk\build-output\%compiler%-%id%.txt 2>C:\Inetpub\wwwroot\sdk\build-output\%compiler%-%id%-err.txt
IF ERRORLEVEL 1 (
echo ^<span style="background-color:Red;color:Black;font-weight:bold"^>%cmdname% Failed^</span^> >C:\Inetpub\wwwroot\sdk\build-output\status-%logid%.html
echo ^<span style="background-color:Red;color:Black;font-weight:bold"^>Failed^</span^>^<br/^> >>C:\Inetpub\wwwroot\sdk\build-output\%logid%.html
@goto exit
) else (
echo ^<span style="background-color:Lime;color:Black;font-weight:bold"^>%cmdname% OK^</span^> >C:\Inetpub\wwwroot\sdk\build-output\status-%logid%.html
echo ^<span style="background-color:Lime;color:Black;font-weight:bold"^>Success^</span^>^<br/^> >>C:\Inetpub\wwwroot\sdk\build-output\%logid%.html
)

set nmakecmd=ms SWIG_VER=4.0.2
set cmdname=MapServer build
for /f "tokens=1-7 delims=:.,- " %%a in ("%date% %time%") do set id=%%a%%b%%c-%%d-%%e-%%f-%%g-%logid%
echo %date% %time%: %cmdname% started ^&nbsp^<a href="%baseurl%%compiler%-%id%.txt"^>stdout^</a^>^&nbsp^<a href="%baseurl%%compiler%-%id%-err.txt"^>stderr^</a^>^&nbsp >>C:\Inetpub\wwwroot\sdk\build-output\%logid%.html
echo ^<span style="background-color:Yellow;color:Black;font-weight:bold"^>%cmdname%^</span^> >C:\Inetpub\wwwroot\sdk\build-output\status-%logid%.html
nmake %nmakecmd% >C:\Inetpub\wwwroot\sdk\build-output\%compiler%-%id%.txt 2>C:\Inetpub\wwwroot\sdk\build-output\%compiler%-%id%-err.txt
IF ERRORLEVEL 1 (
echo ^<span style="background-color:Red;color:Black;font-weight:bold"^>%cmdname% Failed^</span^> >C:\Inetpub\wwwroot\sdk\build-output\status-%logid%.html
echo ^<span style="background-color:Red;color:Black;font-weight:bold"^>Failed^</span^>^<br/^> >>C:\Inetpub\wwwroot\sdk\build-output\%logid%.html
@goto exit
) else (
echo ^<span style="background-color:Lime;color:Black;font-weight:bold"^>%cmdname% OK^</span^> >C:\Inetpub\wwwroot\sdk\build-output\status-%logid%.html
echo ^<span style="background-color:Lime;color:Black;font-weight:bold"^>Success^</span^>^<br/^> >>C:\Inetpub\wwwroot\sdk\build-output\%logid%.html
)

set nmakecmd=mapcache
set cmdname=MapCache build
for /f "tokens=1-7 delims=:.,- " %%a in ("%date% %time%") do set id=%%a%%b%%c-%%d-%%e-%%f-%%g-%logid%
echo %date% %time%: %cmdname% started ^&nbsp^<a href="%baseurl%%compiler%-%id%.txt"^>stdout^</a^>^&nbsp^<a href="%baseurl%%compiler%-%id%-err.txt"^>stderr^</a^>^&nbsp >>C:\Inetpub\wwwroot\sdk\build-output\%logid%.html
echo ^<span style="background-color:Yellow;color:Black;font-weight:bold"^>%cmdname%^</span^> >C:\Inetpub\wwwroot\sdk\build-output\status-%logid%.html
nmake %nmakecmd% >C:\Inetpub\wwwroot\sdk\build-output\%compiler%-%id%.txt 2>C:\Inetpub\wwwroot\sdk\build-output\%compiler%-%id%-err.txt
IF ERRORLEVEL 1 (
echo ^<span style="background-color:Red;color:Black;font-weight:bold"^>%cmdname% Failed^</span^> >C:\Inetpub\wwwroot\sdk\build-output\status-%logid%.html
echo ^<span style="background-color:Red;color:Black;font-weight:bold"^>Failed^</span^>^<br/^> >>C:\Inetpub\wwwroot\sdk\build-output\%logid%.html
@goto exit
) else (
echo ^<span style="background-color:Lime;color:Black;font-weight:bold"^>%cmdname% OK^</span^> >C:\Inetpub\wwwroot\sdk\build-output\status-%logid%.html
echo ^<span style="background-color:Lime;color:Black;font-weight:bold"^>Success^</span^>^<br/^> >>C:\Inetpub\wwwroot\sdk\build-output\%logid%.html
)

set nmakecmd=ms-csharp-test
set cmdname=MapServer csharp test
for /f "tokens=1-7 delims=:.,- " %%a in ("%date% %time%") do set id=%%a%%b%%c-%%d-%%e-%%f-%%g-%logid%
echo %date% %time%: %cmdname% started ^&nbsp^<a href="%baseurl%%compiler%-%id%.txt"^>stdout^</a^>^&nbsp^<a href="%baseurl%%compiler%-%id%-err.txt"^>stderr^</a^>^&nbsp >>C:\Inetpub\wwwroot\sdk\build-output\%logid%.html
echo ^<span style="background-color:Yellow;color:Black;font-weight:bold"^>%cmdname%^</span^> >C:\Inetpub\wwwroot\sdk\build-output\status-%logid%.html
nmake %nmakecmd% >C:\Inetpub\wwwroot\sdk\build-output\%compiler%-%id%.txt 2>C:\Inetpub\wwwroot\sdk\build-output\%compiler%-%id%-err.txt
IF ERRORLEVEL 1 (
echo ^<span style="background-color:Red;color:Black;font-weight:bold"^>%cmdname% Failed^</span^> >C:\Inetpub\wwwroot\sdk\build-output\status-%logid%.html
echo ^<span style="background-color:Red;color:Black;font-weight:bold"^>Failed^</span^>^<br/^> >>C:\Inetpub\wwwroot\sdk\build-output\%logid%.html
) else (
echo ^<span style="background-color:Lime;color:Black;font-weight:bold"^>%cmdname% OK^</span^> >C:\Inetpub\wwwroot\sdk\build-output\status-%logid%.html
echo ^<span style="background-color:Lime;color:Black;font-weight:bold"^>Success^</span^>^<br/^> >>C:\Inetpub\wwwroot\sdk\build-output\%logid%.html
)

set nmakecmd=ms-java-test
set cmdname=MapServer java test
for /f "tokens=1-7 delims=:.,- " %%a in ("%date% %time%") do set id=%%a%%b%%c-%%d-%%e-%%f-%%g-%logid%
echo %date% %time%: %cmdname% started ^&nbsp^<a href="%baseurl%%compiler%-%id%.txt"^>stdout^</a^>^&nbsp^<a href="%baseurl%%compiler%-%id%-err.txt"^>stderr^</a^>^&nbsp >>C:\Inetpub\wwwroot\sdk\build-output\%logid%.html
echo ^<span style="background-color:Yellow;color:Black;font-weight:bold"^>%cmdname%^</span^> >C:\Inetpub\wwwroot\sdk\build-output\status-%logid%.html
nmake %nmakecmd% >C:\Inetpub\wwwroot\sdk\build-output\%compiler%-%id%.txt 2>C:\Inetpub\wwwroot\sdk\build-output\%compiler%-%id%-err.txt
IF ERRORLEVEL 1 (
echo ^<span style="background-color:Red;color:Black;font-weight:bold"^>%cmdname% Failed^</span^> >C:\Inetpub\wwwroot\sdk\build-output\status-%logid%.html
echo ^<span style="background-color:Red;color:Black;font-weight:bold"^>Failed^</span^>^<br/^> >>C:\Inetpub\wwwroot\sdk\build-output\%logid%.html
) else (
echo ^<span style="background-color:Lime;color:Black;font-weight:bold"^>%cmdname% OK^</span^> >C:\Inetpub\wwwroot\sdk\build-output\status-%logid%.html
echo ^<span style="background-color:Lime;color:Black;font-weight:bold"^>Success^</span^>^<br/^> >>C:\Inetpub\wwwroot\sdk\build-output\%logid%.html
)

set nmakecmd=ms-php-test
set cmdname=MapServer php test
for /f "tokens=1-7 delims=:.,- " %%a in ("%date% %time%") do set id=%%a%%b%%c-%%d-%%e-%%f-%%g-%logid%
echo %date% %time%: %cmdname% started ^&nbsp^<a href="%baseurl%%compiler%-%id%.txt"^>stdout^</a^>^&nbsp^<a href="%baseurl%%compiler%-%id%-err.txt"^>stderr^</a^>^&nbsp >>C:\Inetpub\wwwroot\sdk\build-output\%logid%.html
echo ^<span style="background-color:Yellow;color:Black;font-weight:bold"^>%cmdname%^</span^> >C:\Inetpub\wwwroot\sdk\build-output\status-%logid%.html
nmake %nmakecmd% >C:\Inetpub\wwwroot\sdk\build-output\%compiler%-%id%.txt 2>C:\Inetpub\wwwroot\sdk\build-output\%compiler%-%id%-err.txt
IF ERRORLEVEL 1 (
echo ^<span style="background-color:Red;color:Black;font-weight:bold"^>%cmdname% Failed^</span^> >C:\Inetpub\wwwroot\sdk\build-output\status-%logid%.html
echo ^<span style="background-color:Red;color:Black;font-weight:bold"^>Failed^</span^>^<br/^> >>C:\Inetpub\wwwroot\sdk\build-output\%logid%.html
) else (
echo ^<span style="background-color:Lime;color:Black;font-weight:bold"^>%cmdname% OK^</span^> >C:\Inetpub\wwwroot\sdk\build-output\status-%logid%.html
echo ^<span style="background-color:Lime;color:Black;font-weight:bold"^>Success^</span^>^<br/^> >>C:\Inetpub\wwwroot\sdk\build-output\%logid%.html
)

set nmakecmd=ms-python-bdist
set cmdname=MapServer python packaging
for /f "tokens=1-7 delims=:.,- " %%a in ("%date% %time%") do set id=%%a%%b%%c-%%d-%%e-%%f-%%g-%logid%
echo %date% %time%: %cmdname% started ^&nbsp^<a href="%baseurl%%compiler%-%id%.txt"^>stdout^</a^>^&nbsp^<a href="%baseurl%%compiler%-%id%-err.txt"^>stderr^</a^>^&nbsp >>C:\Inetpub\wwwroot\sdk\build-output\%logid%.html
echo ^<span style="background-color:Yellow;color:Black;font-weight:bold"^>%cmdname%^</span^> >C:\Inetpub\wwwroot\sdk\build-output\status-%logid%.html
nmake %nmakecmd% >C:\Inetpub\wwwroot\sdk\build-output\%compiler%-%id%.txt 2>C:\Inetpub\wwwroot\sdk\build-output\%compiler%-%id%-err.txt
IF ERRORLEVEL 1 (
echo ^<span style="background-color:Red;color:Black;font-weight:bold"^>%cmdname% Failed^</span^> >C:\Inetpub\wwwroot\sdk\build-output\status-%logid%.html
echo ^<span style="background-color:Red;color:Black;font-weight:bold"^>Failed^</span^>^<br/^> >>C:\Inetpub\wwwroot\sdk\build-output\%logid%.html
@goto exit
) else (
echo ^<span style="background-color:Lime;color:Black;font-weight:bold"^>%cmdname% OK^</span^> >C:\Inetpub\wwwroot\sdk\build-output\status-%logid%.html
echo ^<span style="background-color:Lime;color:Black;font-weight:bold"^>Success^</span^>^<br/^> >>C:\Inetpub\wwwroot\sdk\build-output\%logid%.html
)

set nmakecmd=ms-autotest
set cmdname=MapServer autotest
for /f "tokens=1-7 delims=:.,- " %%a in ("%date% %time%") do set id=%%a%%b%%c-%%d-%%e-%%f-%%g-%logid%
echo %date% %time%: %cmdname% started ^&nbsp^<a href="%baseurl%%compiler%-%id%.txt"^>stdout^</a^>^&nbsp^<a href="%baseurl%%compiler%-%id%-err.txt"^>stderr^</a^>^&nbsp >>C:\Inetpub\wwwroot\sdk\build-output\%logid%.html
echo ^<span style="background-color:Yellow;color:Black;font-weight:bold"^>%cmdname%^</span^> >C:\Inetpub\wwwroot\sdk\build-output\status-%logid%.html
nmake %nmakecmd% >C:\Inetpub\wwwroot\sdk\build-output\%compiler%-%id%.txt 2>C:\Inetpub\wwwroot\sdk\build-output\%compiler%-%id%-err.txt
IF ERRORLEVEL 1 (
echo ^<span style="background-color:Red;color:Black;font-weight:bold"^>%cmdname% Failed^</span^> >C:\Inetpub\wwwroot\sdk\build-output\status-%logid%.html
echo ^<span style="background-color:Red;color:Black;font-weight:bold"^>Failed^</span^>^<br/^> >>C:\Inetpub\wwwroot\sdk\build-output\%logid%.html
) else (
echo ^<span style="background-color:Lime;color:Black;font-weight:bold"^>%cmdname% OK^</span^> >C:\Inetpub\wwwroot\sdk\build-output\status-%logid%.html
echo ^<span style="background-color:Lime;color:Black;font-weight:bold"^>Success^</span^>^<br/^> >>C:\Inetpub\wwwroot\sdk\build-output\%logid%.html
)

set nmakecmd=op-disable
set cmdname=MapServer installer
for /f "tokens=1-7 delims=:.,- " %%a in ("%date% %time%") do set id=%%a%%b%%c-%%d-%%e-%%f-%%g-%logid%
echo %date% %time%: %cmdname% started ^&nbsp^<a href="%baseurl%%compiler%-%id%.txt"^>stdout^</a^>^&nbsp^<a href="%baseurl%%compiler%-%id%-err.txt"^>stderr^</a^>^&nbsp >>C:\Inetpub\wwwroot\sdk\build-output\%logid%.html
echo ^<span style="background-color:Yellow;color:Black;font-weight:bold"^>%cmdname%^</span^> >C:\Inetpub\wwwroot\sdk\build-output\status-%logid%.html
nmake %nmakecmd% >C:\Inetpub\wwwroot\sdk\build-output\%compiler%-%id%.txt 2>C:\Inetpub\wwwroot\sdk\build-output\%compiler%-%id%-err.txt
IF ERRORLEVEL 1 (
echo ^<span style="background-color:Red;color:Black;font-weight:bold"^>%cmdname% Failed^</span^> >C:\Inetpub\wwwroot\sdk\build-output\status-%logid%.html
echo ^<span style="background-color:Red;color:Black;font-weight:bold"^>Failed^</span^>^<br/^> >>C:\Inetpub\wwwroot\sdk\build-output\%logid%.html
@goto exit
) else (
echo ^<span style="background-color:Lime;color:Black;font-weight:bold"^>%cmdname% OK^</span^> >C:\Inetpub\wwwroot\sdk\build-output\status-%logid%.html
echo ^<span style="background-color:Lime;color:Black;font-weight:bold"^>Success^</span^>^<br/^> >>C:\Inetpub\wwwroot\sdk\build-output\%logid%.html
)

set nmakecmd=package PKG_VERSION=%pkg-version% INSTALL_DIR=C:\Inetpub\wwwroot\sdk\downloads
set cmdname=Packaging
for /f "tokens=1-7 delims=:.,- " %%a in ("%date% %time%") do set id=%%a%%b%%c-%%d-%%e-%%f-%%g-%logid%
echo %date% %time%: %cmdname% started ^&nbsp^<a href="%baseurl%%compiler%-%id%.txt"^>stdout^</a^>^&nbsp^<a href="%baseurl%%compiler%-%id%-err.txt"^>stderr^</a^>^&nbsp >>C:\Inetpub\wwwroot\sdk\build-output\%logid%.html
echo ^<span style="background-color:Yellow;color:Black;font-weight:bold"^>%cmdname%^</span^> >C:\Inetpub\wwwroot\sdk\build-output\status-%logid%.html
nmake %nmakecmd% >C:\Inetpub\wwwroot\sdk\build-output\%compiler%-%id%.txt 2>C:\Inetpub\wwwroot\sdk\build-output\%compiler%-%id%-err.txt
IF ERRORLEVEL 1 (
echo ^<span style="background-color:Red;color:Black;font-weight:bold"^>%cmdname% Failed^</span^> >C:\Inetpub\wwwroot\sdk\build-output\status-%logid%.html
echo ^<span style="background-color:Red;color:Black;font-weight:bold"^>Failed^</span^>^<br/^> >>C:\Inetpub\wwwroot\sdk\build-output\%logid%.html
@goto exit
) else (
echo ^<span style="background-color:Lime;color:Black;font-weight:bold"^>%cmdname% OK^</span^> >C:\Inetpub\wwwroot\sdk\build-output\status-%logid%.html
echo ^<span style="background-color:Lime;color:Black;font-weight:bold"^>Success^</span^>^<br/^> >>C:\Inetpub\wwwroot\sdk\build-output\%logid%.html
)

set nmakecmd=package-libs PKG_VERSION=%pkg-version% INSTALL_DIR=C:\Inetpub\wwwroot\sdk\downloads
set cmdname=Packaging headers and libs
for /f "tokens=1-7 delims=:.,- " %%a in ("%date% %time%") do set id=%%a%%b%%c-%%d-%%e-%%f-%%g-%logid%
echo %date% %time%: %cmdname% started ^&nbsp^<a href="%baseurl%%compiler%-%id%.txt"^>stdout^</a^>^&nbsp^<a href="%baseurl%%compiler%-%id%-err.txt"^>stderr^</a^>^&nbsp >>C:\Inetpub\wwwroot\sdk\build-output\%logid%.html
echo ^<span style="background-color:Yellow;color:Black;font-weight:bold"^>%cmdname%^</span^> >C:\Inetpub\wwwroot\sdk\build-output\status-%logid%.html
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

:exit

echo ^<hr/^> >>C:\Inetpub\wwwroot\sdk\build-output\%logid%.html

