@echo off
echo Starting Update...
powershell wget "https://github.com/IWickGames/TModLoaderInstaller/archive/master.zip" -OutFile "update.zip">nul
7za x "update.zip">nul
del /f /q "Install TMOD Loader.bat">nul
move "TModLoaderInstaller-master\Install TMOD Loader.bat" "">nul
echo Done!
timeout /nobreak 1 >nul
echo NoUpdate>update.dat
rd /s /q "TModLoaderInstaller-master"
del /f /s "update.zip"
start "" "Install TMOD Loader.bat"
exit