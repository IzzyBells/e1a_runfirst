@echo off
cd /d "%~dp0"
echo ================================
echo      service menu settings
echo ================================
echo 1. Normal Arcade Mode with Story and Training
echo 2. Tournament settings with Free Play and FT2 automatically enabled (single player not available)
echo 3. Exit
echo ================================

CHOICE /C 123 /M "Enter your choice"

:: Checking with exact matches using EQU
if %ERRORLEVEL% equ 1 goto :normal
if %ERRORLEVEL% equ 2 goto :tournament
if %ERRORLEVEL% equ 3 goto :Exit

:normal
xcopy "%~dp0runfirst_script_files\sv_story_training\sv" "%~dp0sv" /E /I /Y
goto :Exit

:tournament
xcopy "%~dp0runfirst_script_files\sv_ft2_tournament\sv" "%~dp0sv" /E /I /Y
goto :Exit

:Exit
exit