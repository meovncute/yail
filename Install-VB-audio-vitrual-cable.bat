@echo off

echo Kiem tra VB-CABLE...

powershell -Command "Get-PnpDevice | findstr /i 'VB-Audio'"

if %errorlevel%==0 (
    echo VB-CABLE da duoc cai, bo qua.
    exit
)

echo Chua co VB-CABLE, bat dau cai...

set "DL=%USERPROFILE%\Downloads"
set "ZIP=%DL%\VBCABLE_Driver_Pack45.zip"
set "DIR=%DL%\VBCABLE_Driver_Pack45"

powershell -Command "Invoke-WebRequest 'https://download.vb-audio.com/Download_CABLE/VBCABLE_Driver_Pack45.zip' -OutFile '%ZIP%'"

powershell -Command "Expand-Archive '%ZIP%' -DestinationPath '%DIR%' -Force"

start "" "%DIR%\VBCABLE_Setup_x64.exe"

pause
