@echo off
REM Vérifie si le script est exécuté en tant qu'administrateur
net session >nul 2>&1
if %errorLevel% NEQ 0 (
    echo Exécutez ce script en tant qu'administrateur.
    pause
    exit /b
)

REM Ajoute la valeur verbosestatus au registre
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v verbosestatus /t REG_DWORD /d 1 /f

echo La valeur verbosestatus a été ajoutée au registre.
pause
