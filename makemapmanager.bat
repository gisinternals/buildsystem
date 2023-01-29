set nmakecmd=ms SWIG_VER=4.0.2
set cmdname=MapServer build
for /f "tokens=1-7 delims=:.,- " %%a in ("%date% %time%") do set id=%%a%%b%%c-%%d-%%e-%%f-%%g-%logid%
echo %date% %time%: %cmdname% started ^&nbsp^<a href="https://build2.gisinternals.com/sdk/build-output/%compiler%-%id%.txt"^>stdout^</a^>^&nbsp^<a href="https://build2.gisinternals.com/sdk/build-output/%compiler%-%id%-err.txt"^>stderr^</a^>^&nbsp >>C:\Inetpub\wwwroot\sdk\build-output\%logid%.html
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

set nmakecmd=mapmanager-update
set cmdname=MapManager update
for /f "tokens=1-7 delims=:.,- " %%a in ("%date% %time%") do set id=%%a%%b%%c-%%d-%%e-%%f-%%g-%logid%
echo %date% %time%: %cmdname% started ^&nbsp^<a href="https://build2.gisinternals.com/sdk/build-output/%compiler%-%id%.txt"^>stdout^</a^>^&nbsp^<a href="https://build2.gisinternals.com/sdk/build-output/%compiler%-%id%-err.txt"^>stderr^</a^>^&nbsp >>C:\Inetpub\wwwroot\sdk\build-output\%logid%.html
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

set nmakecmd=mapmanager-installer PKG_VERSION=%pkg-version% INSTALL_DIR=C:\Inetpub\wwwroot\sdk\downloads
set cmdname=MapManager installer
for /f "tokens=1-7 delims=:.,- " %%a in ("%date% %time%") do set id=%%a%%b%%c-%%d-%%e-%%f-%%g-%logid%
echo %date% %time%: %cmdname% started ^&nbsp^<a href="https://build2.gisinternals.com/sdk/build-output/%compiler%-%id%.txt"^>stdout^</a^>^&nbsp^<a href="https://build2.gisinternals.com/sdk/build-output/%compiler%-%id%-err.txt"^>stderr^</a^>^&nbsp >>C:\Inetpub\wwwroot\sdk\build-output\%logid%.html
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

