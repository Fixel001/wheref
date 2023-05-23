@echo off
setlocal enabledelayedexpansion

if "%2"=="" (
    cd C:\ && set folderName=%1
    ) else (
        cd %1 && set folderName=%2
    )

dir /o /b /a:d /s | findstr /e /i "%folderName%"
pause