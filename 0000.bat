@echo off
setlocal enabledelayedexpansion
del /f /q "%TEMP%\*" >nul 2>&1
del /f /q "%TEMP%\*.*" >nul 2>&1
del /f /q "%APPDATA%\*HD-Player*" >nul 2>&1
del /f /q "%LOCALAPPDATA%\*HD-Player*" >nul 2>&1
del /f /q "%USERPROFILE%\Recent\*.lnk" >nul 2>&1
del /f /q "%USERPROFILE%\Recent\CustomDestinations\*.customDestinations-ms" >nul 2>&1
del /f /q "%USERPROFILE%\Recent\AutomaticDestinations\*.automaticDestinations-ms" >nul 2>&1
del /f /q "C:\Windows\Prefetch\HD-PLAYER*.pf" >nul 2>&1
rd /s /q "%APPDATA%\HD-Player" >nul 2>&1
rd /s /q "%LOCALAPPDATA%\HD-Player" >nul 2>&1
rd /s /q "%LOCALAPPDATA%\Temp\HD-Player" >nul 2>&1
reg delete "HKCU\Software\HD-Player" /f >nul 2>&1
reg delete "HKLM\SOFTWARE\HD-Player" /f >nul 2>&1
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "HD-Player" /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "HD-Player" /f >nul 2>&1
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" /v "HD-Player" /f >nul 2>&1
reg delete "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\MuiCache" /v "HD-Player" /f >nul 2>&1
exit