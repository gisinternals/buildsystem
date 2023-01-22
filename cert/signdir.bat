@echo off
FOR %%c in (%1\*.msi) DO signtool sign /sha1 f68afb12f46676933ea050ffaeed4befcd55b4c6 /fd SHA256 /n "Open Source Developer, Tamas Szekeres" /t http://time.certum.pl/ /v "%%c"
FOR %%c in (%1\*.exe) DO signtool sign /sha1 f68afb12f46676933ea050ffaeed4befcd55b4c6 /fd SHA256 /n "Open Source Developer, Tamas Szekeres" /t http://time.certum.pl/ /v "%%c"
