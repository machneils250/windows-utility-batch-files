@echo off

if "%1"=="" (	
	ECHO ERROR: Missing PATH parameter.
	ECHO Usage: ListExtensions.bat ^<my path^>
	ECHO Example: ListExtensions.bat "D:\Universe\MilkyWay\ChocoWay"
	goto end_of_script
)	
  
ECHO ..Now listing file extensions.. 
ECHO ..This may take some time (depending on the number of files in your path..
ECHO.
  
set target=%~1
if "%target%"=="" set target=%cd%

setlocal EnableDelayedExpansion

set LF=^


rem Previous two lines deliberately left blank for LF to work.

for /f "tokens=*" %%i in ('dir /b /s /a:-d "%target%"') do (
    set ext=%%~xi
    if "!ext!"=="" set ext=FileWithNoExtension
    echo !extlist! | find "!ext!:" > nul
    if not !ERRORLEVEL! == 0 set extlist=!extlist!!ext!:
)

echo %extlist::=!LF!%

ECHO Job Finished........

:end_of_script

endlocal