@echo off
setlocal

set "search_folder=C:\Path\To\Start\Search"
set "target_folder=FolderNameToFind"

if %2=="" (set "search_folder=C:\" && set "folderName=%1") else (set "search_folder=%1" && set "folderName=%2")

for /r "%search_folder%" %%G in (.) do (
    if /i "%%~nxG"=="%target_folder%" (
        echo %%~dpG
    )
)

endlocal