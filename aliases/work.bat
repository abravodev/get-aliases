:::::::::::::::::::::::::::::::::::::::::::::
::::::: Script to make your repository folder easy to be accessed from everywhere
::::::: We used:
:::::::			- 'ls' command to list folders. From linux style (installed from scoop)
:::::::			- Code to color some specific lines. From https://stackoverflow.com/a/21666354
:::::::::::::::::::::::::::::::::::::::::::::

@echo off
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set "DEL=%%a"
)

:::::::::::::::::::::::::::::::::::::::::::::
::::::: Main
:::::::::::::::::::::::::::::::::::::::::::::
IF %1.==. GOTO noSpecificPath
SET folder=%1
call:getPath %1
cd %repo%\%folder%
goto :end

:noSpecificPath
cd %repo%

:::::::::::: Let's finish all of this
:end
call:greenLine "##############################"
call:greenLine "####      Let's work      ####"
call:greenLine "##############################"
ls
:: Set color back to default: BG: 0-black, FG: 1-White
goto:eof

:::::::::::::::::::::::::::::::::::::::::::::
::::::: Functions
:::::::::::::::::::::::::::::::::::::::::::::

:: Tries to resolve the path depending on the shorcut user may have passed
:getPath
::	%~1 The shortcut for the path
SET shorcut=%~1

IF /i %shorcut%==a (
	SET folder=Android
) ELSE (IF /i %shorcut%==n (
	SET folder=NET
))
:: Argument is not a shortcut we know...
goto:eof

:: Colors in green the line passed by
:greenLine
::	%~1 The line you want to be coloured in green
call:colorEcho 02 "%~1"
echo.
goto:eof

:: Colors specific items passed by
:colorEcho
::  %~1 The color in two digits, first digit: background; second digit: foreground
::	%~2	The text you want to be coloured
echo off
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1i
goto:eof