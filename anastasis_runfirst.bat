@ECHO off
TITLE Nami's Anastasis script
ECHO Nami's Anastasis script for running on laptop screen or LCD
cd /d "%~dp0"

IF EXIST "runfirst_script_files\answer1.txt" ( 
	goto first
) ELSE (
	choice /M "Have you installed .NET, Visual C++, and DirectX on this computer?"

	if errorlevel 2 goto OptionNo1
	if errorlevel 1 goto OptionYes1

	:OptionYes1
	echo yes > runfirst_script_files/answer1.txt
	goto first

	:OptionNo1
	echo Go to the directory E1A_121 > runfirst_script_files > optional CMD script" subfolder inside of that.
	echo Right-click the silent_dx_dotnet_vc_installer.cmd file in the subfolder and run it as Administrator.
	echo This will install .NET, Visual C++, and DirectX to ensure the game and tools are not missing dependencies.
	timeout 10 > nul
	goto first
)

:first
IF EXIST "runfirst_script_files\answer2.txt" ( 
	goto second
) ELSE (
	choice /M "Have you ran NesicaXlive.reg on this machine at least once ever?"

	if errorlevel 2 goto OptionNo2
	if errorlevel 1 goto OptionYes2

	:OptionYes2
	echo yes > runfirst_script_files/answer2.txt
	goto second

	:OptionNo2
	echo Before running Anastasis, double-click NesicaXlive.reg to install the NesicaXLive registry files the game expects.
	timeout 10 > nul
	goto second
)

:second
IF EXIST D:\nul (
	goto third
) ELSE (
	ECHO Making sure D:\ drive exists with subst... stops whitescreen crash
	subst D: "D"
	timeout 2 > nul
	ECHO D:\ drive exists.
	timeout 1 > nul
	goto third
)

:third
ECHO Copying known good dxwrapper.ini...
copy ".\runfirst_script_files\dxwrapper.ini" "." /y
REM ####################################
REM    SET HERE THE RESOLUTION WANTED
REM ####################################

SET x=1024
SET y=768
SET r=60

REM ####################################
REM      USING QRES TO CHANGE RES
REM ####################################

runfirst_script_files\QRes.exe /x:%x% /y:%y% /r:%r%

ECHO Screen Resolution Changer
ECHO.
ECHO Script by @AlbertoMGV
ECHO Using QRES by Anders Kjersem
ECHO.
ECHO Changing Resolution to %x% x %y% and setting refresh rate to 60hz...
ECHO Done changing resolution.
timeout 3 > nul
CLS

ECHO Preparations are complete to run Anastasis are complete.
ECHO Set the game controls in JConfig if you haven't already done so. Make sure Joy1 is Player1 and Joy2 is Player2.
ECHO If this is not the case, unplug both controllers, wait 5 seconds, then plug in Player1's controller only. Open JConfig and make sure it is recognized.
ECHO Then, close JConfig, plug in Player2's controller, then wait 5 seconds, then open JConfig and both controllers should be recognized and in the correct order.
ECHO.
ECHO PS4/5 controllers will not work or must change to PC mode.
ECHO If an axis automatically binds itself when you try to bind a button, you need to switch controller modes.
ECHO Nintendo Switch mode or DInput mode works best for GP-2040CE controller PCBs.
ECHO. 
ECHO Button 1 = A
ECHO Button 2 = B
ECHO Button 3 = C
ECHO Button 4 = D
ECHO Buttons 5 and 6 are unused.
ECHO Both players should map Start and Coin as well. Player 1 must initiate the match by pressing Start.
ECHO.
ECHO To switch between normal arcade mode (including training mode for Player 1) or FT2 Event Mode, run sv_switch.bat.
ECHO Otherwise, you will need to use the untranslated Service Mode to do so, using the Service button bindable in JConfig.
ECHO Press any key to close this window immediately or wait 60 seconds for it to close automatically.
timeout /t 60 > nul
