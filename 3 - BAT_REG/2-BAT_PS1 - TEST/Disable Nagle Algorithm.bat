@echo off
setlocal

:: Get the list of network adapters
for /f "tokens=3* delims= " %%A in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces"') do (
    :: Set the TcpAckFrequency and TCPNoDelay values to 1
    reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%A" /v TcpAckFrequency /t REG_DWORD /d 1 /f
    reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%A" /v TCPNoDelay /t REG_DWORD /d 1 /f
)

echo Nagle's Algorithm has been disabled for all network adapters.
pause
endlocal
