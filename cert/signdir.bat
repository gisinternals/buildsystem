@echo off
FOR %%c in (%1\*.msi) DO signtool sign /sha1 746ff869e511eb5238d7525a256af201ef646e9b /fd SHA256 /n "Open Source Developer, Tamas Szekeres" /t http://time.certum.pl/ /v "%%c"
FOR %%c in (%1\*.exe) DO signtool sign /sha1 746ff869e511eb5238d7525a256af201ef646e9b /fd SHA256 /n "Open Source Developer, Tamas Szekeres" /t http://time.certum.pl/ /v "%%c"
