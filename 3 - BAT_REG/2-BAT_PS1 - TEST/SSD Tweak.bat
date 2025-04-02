@echo off
reg add "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d "0" /f
reg add "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnableSuperfetch" /t REG_DWORD /d "0" /f
reg add "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnableBoottrace" /t REG_DWORD /d "0" /f
reg add "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "SfTracingState" /t REG_DWORD /d "0" /f

fsutil behavior set memoryusage 2 >nul

fsutil behavior set mftzone 2 >nul

fsutil behavior set disabledeletenotify 0 >nul

fsutil behavior set encryptpagingfile 0 >nul

fsutil behavior set disable8dot3 1 >nul
call :ControlSet "Control\FileSystem" "NtfsDisable8dot3NameCreation" "1"

fsutil behavior set disablecompression 1 >nul

wmic logicaldisk where "DriveType='3' and DeviceID='%systemdrive%'" get DeviceID 2>&1 | find "%systemdrive%" >nul && set "storageType=SSD" || set "storageType=HDD"
if "%storageType%" equ "SSD" (fsutil behavior set disableLastAccess 0
call :ControlSet "Control\FileSystem" "NtfsDisableLastAccessUpdate" "2147483648") >nul
if "%storageType%" equ "HDD" (fsutil behavior set disableLastAccess 1
call :ControlSet "Control\FileSystem" "NtfsDisableLastAccessUpdate" "2147483649") >nul
