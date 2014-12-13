if exist C:\Backup_E\Builds2.7z del C:\Backup_E\Builds2.7z
if exist C:\Backup_E\Builds.7z rename C:\Backup_E\builds.7z Builds2.7z
rem 7z a -tzip C:\Backup_E\Builds.zip E:\Builds
7z a C:\Backup_E\Builds.7z E:\Builds
copy /Y C:\Backup_E\Builds.7z \\ts_hmei\share\Backup