@echo off
echo --------------------------------------
echo Simple Batch File Backup Script By Anon LK
echo --------------------------------------

set "source_folder=C:\source_folder"
set "destination_folder=C:\backups"
set "freq=600"
set "amount=10"

:loop
rem Get current date and time in a consistent format using WMIC
for /f "delims=" %%a in ('wmic OS Get localdatetime ^| find "."') do set "dt=%%a"
set "current_date=%dt:~0,4%-%dt:~4,2%-%dt:~6,2%"
set "current_time=%dt:~8,2%.%dt:~10,2%.%dt:~12,2%"

rem Remove spaces from the destination folder name
set "destination_folder=%destination_folder: =%"

if not exist "%destination_folder%" mkdir "%destination_folder%"

echo --------------
echo Backing up....
echo --------------
xcopy /s /e /I "%source_folder%" "%destination_folder%\%current_date%__%current_time%"
echo Latest Backup: %current_date% %current_time%

rem Delete older backups (keep latest 10)
for /F "skip=%amount% eol=: delims=" %%i in ('dir /b /AD /O-D "%destination_folder%\*"') do rmdir /s /q "%destination_folder%\%%i"

timeout /t %freq% /nobreak >nul
goto loop
