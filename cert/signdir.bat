@echo off
FOR %%c in (%1\*.msi) DO signtool sign /sha1 6e3e7c785cf6c86b7fbd3693760285fe0239eddb /fd SHA256 /n "Open Source Developer, Tamas Szekeres" /t http://time.certum.pl/ /v "%%c"
FOR %%c in (%1\*.exe) DO signtool sign /sha1 6e3e7c785cf6c86b7fbd3693760285fe0239eddb /fd SHA256 /n "Open Source Developer, Tamas Szekeres" /t http://time.certum.pl/ /v "%%c"
