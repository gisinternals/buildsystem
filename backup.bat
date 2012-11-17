if exist C:\Backup_E\Builds2.zip del C:\Backup_E\Builds2.zip
if exist C:\Backup_E\Builds.zip rename C:\Backup_E\builds.zip Builds2.zip
7z a -tzip C:\Backup_E\Builds.zip E:\Builds
copy /Y C:\Backup_E\Builds.zip \\ts_hmei\share\Backup