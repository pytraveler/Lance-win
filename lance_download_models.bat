@echo off
setlocal

echo ================================================================
echo  Lance Model Downloader
echo  Author : Aleks aka pytraveler
echo ================================================================
echo.

:: Determine project root (directory of this bat file)
set "PROJ_ROOT=%~dp0"
:: Remove trailing backslash
if "%PROJ_ROOT:~-1%"=="\" set "PROJ_ROOT=%PROJ_ROOT:~0,-1%"

:: Python interpreter
set "PYTHON=%PROJ_ROOT%\.venv\Scripts\python.exe"
if not exist "%PYTHON%" (
    echo [ERROR] Python not found at %PYTHON%
    echo         Run setup_env.bat first.
    pause
    exit /b 1
)

:: uv.exe (for pip installs)
set "UV=%PROJ_ROOT%\uv.exe"

:: Launch the downloader script
"%PYTHON%" "%PROJ_ROOT%\lance_download_models.py" --uv "%UV%"

endlocal
