@echo off

set currentDir=%cd%

:: Reading variables and changing directory
if "%~1"=="-a" (
    if "%~3"=="" (
        cd C:\ && set folderName=%2
    ) else (
        cd %2 && set folderName=%3
    )
    goto :LenientSearch
)

if "%~1"=="-h" (
    goto :help
    )

if "%~1"=="--help" (
    goto :help
    )

if "%~2"=="" (
    cd C:\ && set folderName=%1
) else (
    cd %1 && set folderName=%2
)

:StrictSearch
powershell write-host -back DarkGreen -fore Black Algorithm 1
dir "%folderName%" /o /b /a:d /s
powershell write-host -back DarkGreen -fore Black Algorithm 2
dir /o /b /a:d /s | findstr /e /i "%folderName%"
powershell write-host -back DarkGreen -fore Black Use the -a option if you still cant find the folder
powershell write-host -back DarkGreen -fore Black Done.
goto :EOF 

:LenientSearch
powershell write-host -back DarkGreen -fore Black Searching for every %folderName% . . .
dir /o /b /a:d /s | findstr /i "%folderName%"
powershell write-host -back DarkGreen -fore Black Done.
goto :EOF

:help
echo Usage: wheref [options] [directory] [folderName]
echo.
echo Options:
echo   -a             Lenient mode: Returns any instance that matches the folderName.
echo   -h / --help    Display this help message.
echo.
echo Description:
echo   wheref is a script that searches for a folder with the specified name within
echo   a directory and its subdirectories.
echo.
echo Examples:
echo   wheref projectA
echo     Searches for the folder named "projectA" in the current directory and its subdirectories.
echo.
echo   wheref "C:\Program Files" projectB
echo     Searches for the folder named "projectB" within "C:\Program Files" and its subdirectories.
echo.
echo   wheref -a "C:\Users" projectC
echo     Searches for any instance that matches the folder named "projectC" within "C:\Users"
echo     and its subdirectories.
echo.
goto :EOF

:EOF
cd %currentDir%