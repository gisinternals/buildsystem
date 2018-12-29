@echo off
FOR %%c in (%1\*.msi) DO signtool sign /sha1 1A1BD22A1C7D8A9BC13453BED8DC33C7EB370274 /fd SHA256 /n "Open Source Developer, Tamas Szekeres" /t http://time.certum.pl/ /v "%%c"
FOR %%c in (%1\*.exe) DO signtool sign /sha1 1A1BD22A1C7D8A9BC13453BED8DC33C7EB370274 /fd SHA256 /n "Open Source Developer, Tamas Szekeres" /t http://time.certum.pl/ /v "%%c"
