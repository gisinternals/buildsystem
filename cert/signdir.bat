@echo off
FOR %%c in (%1\*.msi) DO signtool sign /sha1 72c5b34b4866c30fd23a6051d15e92f7a7db06ca /fd SHA256 /n "Open Source Developer, Tamas Szekeres" /t http://time.certum.pl/ /v "%%c"
FOR %%c in (%1\*.exe) DO signtool sign /sha1 72c5b34b4866c30fd23a6051d15e92f7a7db06ca /fd SHA256 /n "Open Source Developer, Tamas Szekeres" /t http://time.certum.pl/ /v "%%c"
