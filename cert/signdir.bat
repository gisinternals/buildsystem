@echo off
FOR %%c in (%1\*.msi) DO signtool sign /sha1 915fb187da1e2bd2078fb2d8ad309156a26783b7 /fd SHA256 /n "Open Source Developer, Tamas Szekeres" /t http://time.certum.pl/ /v "%%c"
FOR %%c in (%1\*.exe) DO signtool sign /sha1 915fb187da1e2bd2078fb2d8ad309156a26783b7 /fd SHA256 /n "Open Source Developer, Tamas Szekeres" /t http://time.certum.pl/ /v "%%c"
