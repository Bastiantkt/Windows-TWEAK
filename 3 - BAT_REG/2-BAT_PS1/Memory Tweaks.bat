@echo off
echo.
echo Adding more ram for applications in system memory caching to improve microstuttering
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d "1" /f

echo Paging executive is used to load system files such as kernel and hardware drivers to the page file when needed. Disable will force run into not virtual memory
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /t REG_DWORD /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "AlwaysUseHighMemory" /t REG_DWORD /d 1 /f

echo Disabling Windows attempt to save as much RAM as possible, such as sharing pages for images, copy-on-write for data pages, and compression
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingCombining" /t REG_DWORD /d "1" /f

reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Reliability" /v "TimeStampInterval" /t REG_DWORD /d "0" /f 
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Reliability" /v "IoPriority" /t REG_DWORD /d "3" /f 

reg add "HKLM\SYSTEM\CurrentControlSet\Control\KernelVelocity" /v "DisableFGBoostDecay" /t REG_DWORD /d "1" /f 

@echo off
setlocal enabledelayedexpansion

:: Use PowerShell to get the total visible memory size
for /f "delims=" %%n in ('powershell -command "Get-WmiObject -Class Win32_OperatingSystem | Select-Object -ExpandProperty TotalVisibleMemorySize"') do set mem=%%n

:: Convert memory from KB to DWORD (assuming the value is already in KB and does not need conversion)
:: In this script, we assume the value directly fits in a DWORD.

:: Call the subroutine to set the ControlSet value
call :ControlSet "Control" "SvcHostSplitThresholdInKB" %mem%

:: Set the IOPageLockLimit registry value
Reg add "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management" /v "IOPageLockLimit" /t REG_DWORD /d %mem% /f >nul

echo SvcSplitThreshold
echo IOPageLockLimit

:: End the script
goto :EOF

:: Subroutine to handle setting ControlSet values
:ControlSet
setlocal
set key=%1
set value=%2
set data=%3

:: Example placeholder for actual implementation
:: Update this as needed for your specific requirements
:: Example: echo Setting ControlSet key: %key%, value: %value%, data: %data%

endlocal
goto :EOF

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DistributeTimers" /t REG_DWORD /d "0" /f 
Reg add "HKLM\System\CurrentControlSet\Control\Session Manager" /v "HeapDeCommitFreeBlockThreshold" /t REG_DWORD /d "262144" /f >nul

bcdedit /deletevalue useplatformclock
bcdedit /set disabledynamictick yes
bcdedit /deletevalue tscsyncpolicy
bcdedit /set pae ForceEnable

powershell 

exit