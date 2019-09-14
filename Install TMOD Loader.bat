@echo off
if not exist update.dat goto update
mode 70,25
title TModLoader Install
:start
echo.
echo        Please enter your Terraria install directory
echo        EX: E:\SteamLibrary\steamapps\common\Terraria
echo.
set /p installdir="InstallDir>"
set version=v0.11.4
set download=https://github.com/tModLoader/tModLoader/releases/download/v0.11.4/tModLoader.Windows.v0.11.4.zip
echo Starting Powershell
echo Running wget ...
powershell wget "%download%" -OutFile "tmodloader.zip">nul
if not exist tmodloader.zip goto downloaderror
echo Downloaded TModLoader%version%
echo Checking to back up your old copy...
if not exist "%installdir%\Terraria-OLD.zip" goto backup
:endbackup
echo Extracting Modded Copy...
xcopy "tmodloader.zip" "%installdir%">nul
7za x -y -o"%installdir%" "%installdir%\tmodloader.zip">nul
echo Extracted TModLoader%version%
echo Done!
echo Cleaning up install...
del /f /q "tmodloader.zip"
del /f /q "%installdir%\tmodloader.zip"
del /f /q "update.dat"
echo ------------------------------------------------------------------
echo                     Install compleated!
echo Check to make sure that everything is working by starting the game
echo.
echo.
echo.
echo                    Press any key to exit
pause >nul
exit

:backup
echo Backing up your old copy...
7za a "Terraria-OLD.zip" "D:\SteamLibrary\steamapps\common\Terraria\">nul
move "Terraria-OLD.zip" "D:\SteamLibrary\steamapps\common\Terraria">nul
echo Done!
goto endbackup

:downloaderror
echo Error: Something went wrong wile trying to download the TModLoader.zip file...
echo Press any key to retry!
pause >nul
goto start

:update
start "" "update.bat"
exit