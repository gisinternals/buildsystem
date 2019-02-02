@echo off
FOR %%c in (%1\*.msi) DO signtool sign /sha1 38a83e3ed7181b409427d5af9e8b8d8a8e80860d /fd SHA256 /n "Open Source Developer, Tamas Szekeres" /t http://time.certum.pl/ /v "%%c"
FOR %%c in (%1\*.exe) DO signtool sign /sha1 38a83e3ed7181b409427d5af9e8b8d8a8e80860d /fd SHA256 /n "Open Source Developer, Tamas Szekeres" /t http://time.certum.pl/ /v "%%c"
