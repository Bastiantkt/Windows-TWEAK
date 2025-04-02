@echo off
sc stop SysMain
sc config SysMain start= disabled
echo SysMain service has been disabled.
pause
