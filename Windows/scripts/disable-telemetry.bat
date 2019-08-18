@echo off

net session >nul 2>&1
if NOT %ERRORLEVEL% == 0 (
    echo Please run as Administrator!
    pause
    exit
)

schtasks /change /tn "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /disable
schtasks /change /tn "\Microsoft\Windows\Application Experience\ProgramDataUpdater" /disable
sc config DiagTrack start= disabled
sc stop DiagTrack
pause