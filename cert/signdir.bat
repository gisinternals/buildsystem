@echo off
FOR %%c in (%1\*.msi) DO signtool sign /sha1 6625f220f871971979ab480953f19f77ecf05f3b /fd SHA256 /t http://time.certum.pl/ /v "%%c"
FOR %%c in (%1\*.exe) DO signtool sign /sha1 6625f220f871971979ab480953f19f77ecf05f3b /fd SHA256 /t http://time.certum.pl/ /v "%%c"
