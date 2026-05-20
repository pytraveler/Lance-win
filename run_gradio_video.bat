@echo off
chcp 65001 >nul
setlocal

set PYTHON=.venv\Scripts\python.exe
set SCRIPT=lance_gradio_video.py

echo.
echo  Select launch mode:
echo  [1] Normal
echo  [2] With --fp8
echo.
set /p MODE="Enter (1 or 2): "

if "%MODE%"=="1" (
    echo Launching without --fp8...
    "%PYTHON%" "%SCRIPT%"
) else if "%MODE%"=="2" (
    echo Launching with --fp8...
    "%PYTHON%" "%SCRIPT%" --fp8
) else (
    echo Invalid choice.
    pause
    exit /b 1
)

endlocal
