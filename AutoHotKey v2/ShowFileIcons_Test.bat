@echo OFF
echo. Waiting for script to exit...
echo.

set AutoHotkey="C:\_Programming\AutoHotkey\v2\AutoHotkey64.exe"
set Script="ShowFileIcons.ahk"


:: Swap REM to test:

:: Scripts Have No Icons
REM set Params="ShowFileIcons.ahk"

:: Has Icons
set Params="notepad.exe"


%AutoHotkey64% %Script% %Params%

cls

if %errorlevel%==1 (
	echo.
	echo No Icons In: %Params%
) else (
	echo.
	echo "%Params% Has Icons!"
)


echo.
pause