::this script will uninstall Carbon Black Cloud Sensor on a Windows Machine
::Tested on Win 10
::Enter dereg code where applicable after unistall.exe /uninstall <dereg code>

@echo off
cls
NET SESSION >nul 2>&1

IF %ERRORLEVEL% EQU 0 (
echo "This will uninstall Carbon Black Cloud Sensor in your endpoint"
) ELSE (
	echo.
	echo ####### ERROR: ADMINISTRATOR PRIVILEGES REQUIRED #########
	echo This script must be run as administrator to work properly!  
	echo If you're seeing this after clicking on a start menu icon, 
	echo then right click on the shortcut and select "Run As Administrator".
	echo ##########################################################
	EXIT /B 1
	)
echo.

IF exist "c:\Program Files\Confer\scanner\" (
	echo "Starting uninstallation"
	cd c:\Program Files\Confer
	uninstall.exe /uninstall
) ELSE ( 
	echo Seems that Carbon Black Cloud has been uninstalled
	EXIT /B 1 
)

echo.
echo "Confirming if Carbon Black Service is still available."
echo. 
echo "If you see service still available, please run the script again"
echo "Or uninstall it manually via Add and Remove Settings" 
echo.
sc query cbdefense