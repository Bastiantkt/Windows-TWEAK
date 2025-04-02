:: Delete Windir Temp Files
del /s /f /q "%windir%\temp\*.*" >NUL 2>&1
rd /s /q "%windir%\temp" >NUL 2>&1
md "%windir%\temp" >NUL 2>&1

:: Delete Appdata Temp Files
del /s /f /q "%temp%\*.*" >NUL 2>&1
rd /s /q "%temp%" >NUL 2>&1
md "%temp%" >NUL 2>&1

:: Delete Windir Log Files
del /s /f /q "%windir%\*.log" >NUL 2>&1

:: Delete Files in Windows Update Dir
for %%F in ("%SystemRoot%\SoftwareDistribution\Download\*") do (
    del "%%F" /q /f >NUL 2>&1
    rd "%%F" /s /q >NUL 2>&1
) >NUL 2>&1

:: Delete Internet Temp Files
for %%A in ("%localappdata%\Microsoft\Windows\INetCache\IE\*") do (
    del "%%A" /q /f >NUL 2>&1
    rd "%%A" /s /q >NUL 2>&1
) >NUL 2>&1

:: Clearing Icon Cache
del /s /f /q "%LOCALAPPDATA%\IconCache.db" >NUL 2>&
del /s /f /q "%LOCALAPPDATA%\Microsoft\Windows\Explorer\iconcache*" >NUL 2>&
del /s /f /q "%LOCALAPPDATA%\Microsoft\Windows\Explorer\thumbcache*" >NUL 2>&

:: Clearing Recycle Bin
powershell Clear-RecycleBin -Force >NUL 2>&1

echo 	Temp Files have been cleaned up
timeout 4 >NUL 2>&1