@echo off
FOR %%c in (%1\*.msi) DO signtool sign /sha1 c34335831cd48077484114fa0445b2727127f195 /fd SHA256 /t http://time.certum.pl/ /v "%%c"
FOR %%c in (%1\*.exe) DO signtool sign /sha1 c34335831cd48077484114fa0445b2727127f195 /fd SHA256 /t http://time.certum.pl/ /v "%%c"
