@echo off

color 0e


set adb="..\..\bin\adb.exe"
set adbKill="%~dp0bin\adb.exe" kill-server
set adbStart="%~dp0bin\adb.exe" start-server
set adbWait=%adb% wait-for-device
set sleep="..\..\bin\wait.exe"

set install=%adb% install
set uninstall=%adb% uninstall
set push=%adb% push
set pull=%adb% pull
set shell=%adb% shell

set name=0

cls
echo Type Name of JAR (NO SPACES) To REMOVE and Press ENTER:
echo.
echo.

set /p name=

set continue=0
cls
echo Are You Sure You Want To REMOVE The Following [Y/N]?
echo.
echo /system/framework/%name%
echo.
echo.

set /p continue=


if %continue%==0 goto end
if %continue%==n goto end
if %continue%==N goto end


%shell% "su -c mount -o remount,rw /system"
%sleep% 2
%shell% "su -c rm -f /system/framework/%name%/"


:end



