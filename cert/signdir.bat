@echo off
FOR %%c in (%1\*.msi) DO signtool sign /fd SHA256 /n "Open Source Developer, Tamas Szekeres" /t http://time.certum.pl/ /v "%%c"
FOR %%c in (%1\*.exe) DO signtool sign /fd SHA256 /n "Open Source Developer, Tamas Szekeres" /t http://time.certum.pl/ /v "%%c"
