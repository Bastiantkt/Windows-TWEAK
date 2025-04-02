@echo off 
timeout /t 1 /nobreak >nul
powershell -Command "Stop-Process -Name wmiprvse -ErrorAction SilentlyContinue -Force"
taskkill /f /im MoUsoCoreWorker.exe
taskkill /f /im sppsvc.exe
taskkill /f /im TiWorker.exe
taskkill /f /im ApplicationFrameHost.exe
timeout /t 1 /nobreak >nul
powershell -Command "Stop-Process -Name wmiprvse -ErrorAction SilentlyContinue -Force"
taskkill /f /im MoUsoCoreWorker.exe
taskkill /f /im sppsvc.exe
taskkill /f /im TiWorker.exe
taskkill /f /im ApplicationFrameHost.exe
taskkill /f /im mobsync.exe
timeout /t 1 /nobreak >nul
taskkill /f /im userinit.exe
powershell -Command "Stop-Process -Name wmiprvse -ErrorAction SilentlyContinue -Force"
taskkill /f /im TrustedInstaller.exe
taskkill /f /im SettingSyncHost.exe
taskkill /f /im WmiPrvSE.exe
taskkill /f /im dasHost.exe
taskkill /f /im wlanext.exe
taskkill /f /im sppsvc.exe
taskkill /f /im sppsvc.exe
taskkill /f /im DWMBlurGlass.exe
taskkill /f /im msiexec.exe
taskkill /f /im MSIAfterburner.exe
timeout /t 1 /nobreak >nul
net stop NVDisplay.ContainerLocalSystem
powershell -Command "Stop-Process -Name wmiprvse -ErrorAction SilentlyContinue -Force"
powershell -Command "Stop-Process -Name TrustedInstaller -ErrorAction SilentlyContinue -Force"
powershell -Command "Stop-Process -Name GamingServices -ErrorAction SilentlyContinue -Force"
powershell -Command "Stop-Process -Name GamingServicesNet -ErrorAction SilentlyContinue -Force"
powershell -Command "Stop-Process -Name WindowsPackageManagerServer -ErrorAction SilentlyContinue -Force"
powershell -Command "Stop-Process -Name sppsvc -ErrorAction SilentlyContinue -Force"
powershell -Command "Stop-Process -Name TiWorker -ErrorAction SilentlyContinue -Force"
powershell -Command "Stop-Process -Name VSSVC -ErrorAction SilentlyContinue -Force"
powershell -Command "Stop-Process -Name MoUsoCoreWorker -ErrorAction SilentlyContinue -Force"
powershell -Command "Stop-Process -Name StoreDesktopExtension -ErrorAction SilentlyContinue -Force"
powershell -Command "Stop-Process -Name WinStore.App -ErrorAction SilentlyContinue -Force"
powershell -Command "Stop-Process -Name MusNotification -ErrorAction SilentlyContinue -Force"
powershell -Command "Stop-Process -Name GamingServices -ErrorAction SilentlyContinue -Force"
powershell -Command "Stop-Process -Name EABackgroundService -ErrorAction SilentlyContinue -Force"
powershell -Command "Stop-Process -Name DataExchangeHost -ErrorAction SilentlyContinue -Force"
powershell -Command "Stop-Process -Name mobsync -ErrorAction SilentlyContinue -Force"
powershell -Command "Stop-Process -Name NVDisplay.Container -ErrorAction SilentlyContinue -Force"
net stop GamingServices
net stop sppsvc
net stop DusmSvc
net stop RmSvc
wmic process where name="dwm.exe" CALL setpriority 64
wmic process where name="explorer.exe" CALL setpriority 64
wmic process where name="audiodg.exe" CALL setpriority 64
wmic process where name="ctfmon.exe" CALL setpriority 64
wmic process where name="winlogon.exe" CALL setpriority 64
wmic process where name="wininit.exe" CALL setpriority 64
wmic process where name="taskhostw.exe" CALL setpriority 64
wmic process where name="StartMenuExperienceHost.exe" CALL setpriority 64
wmic process where name="ShellExperienceHost.exe" CALL setpriority 64
wmic process where name="SearchHost.exe" CALL setpriority 64
wmic process where name="smss.exe" CALL setpriority 64
