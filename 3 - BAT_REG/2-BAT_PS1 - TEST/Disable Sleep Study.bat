schtasks /change /tn "\microsoft\windows\power efficiency diagnostics\analyzesystem" /disable >nul 2>&1
wevtutil set-log "Microsoft-Windows-SleepStudy/Diagnostic" /e:False >nul
wevtutil set-log "Microsoft-Windows-Kernel-Processor-Power/Diagnostic" /e:False >nul
wevtutil set-log "Microsoft-Windows-UserModePowerService/Diagnostic" /e:False >nul
echo Disable Sleep Study