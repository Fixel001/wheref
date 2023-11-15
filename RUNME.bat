@echo off

set currentDir=%cd%

:: Create folder for the new command
cd "C:\Users\End User\AppData\Local\Programs"
mkdir wheref2

:: copy the contents over
copy "%currentDir%\wheref.bat" .\wheref2