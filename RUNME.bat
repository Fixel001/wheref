@echo off

set currentDir=%cd%

:: Create folder for the new command
cd "C:\Users\End User\AppData\Local\Programs"
mkdir wheref
cd wheref

:: copy the contents over
copy "%currentDir%\wheref.bat" .

:: set as path
setx PATH "%PATH%;%cd%"