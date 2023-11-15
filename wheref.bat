@echo off

set currentDir=%cd%

:: Reading variables and changing directory
if "%~1"=="-a" (
    if "%~3"=="" (
        cd C:\ && set folderOrFileName=%2
    ) else (
        cd %2 && set folderOrFileName=%3
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
    cd C:\ && set folderOrFileName=%1
) else (
    cd %1 && set folderOrFileName=%2
)

:StrictSearch
powershell write-host -back DarkGreen -fore Black Algorithm 1
dir "%folderOrFileName%" /o /b /a:d /s
powershell write-host -back DarkGreen -fore Black Algorithm 2
dir /o /b /s | findstr /e /i "%folderOrFileName%"

powershell write-host -back DarkGreen -fore Black Use the -a option if you still cant find the folder
powershell write-host -back DarkGreen -fore Black Done.
goto :EOF 

:LenientSearch
powershell write-host -back DarkGreen -fore Black Searching for every %folderOrFileName% . . .
dir /o /b /a:d /s | findstr /i "%folderOrFileName%"
powershell write-host -back DarkGreen -fore Black Done.
goto :EOF

:help
echo Usage: wheref [options] [directory] [folderOrFileName]
echo.
echo Options:
echo   -a             Lenient mode: Returns any instance that matches the folderOrFileName.
echo   -h / --help    Display this help message.
echo.
echo Description:
echo   wheref is a script that searches for a folder/file or file with 
echo   the specified name within a directory and its subdirectories.
echo.
echo Examples:
echo   wheref projectA.exe
echo     Searches for the folder/file named "projectA.exe" starting from root directory and its subdirectories.
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