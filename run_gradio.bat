@echo off
chcp 65001 >nul
setlocal

set PYTHON=.venv\Scripts\python.exe
set SCRIPT=lance_gradio.py

if not defined GRADIO_SERVER_NAME set "GRADIO_SERVER_NAME=0.0.0.0"
if not defined GRADIO_SERVER_PORT set "GRADIO_SERVER_PORT=7860"
if not defined LANCE_GPUS set "LANCE_GPUS=0"

echo.
echo  Lance Unified Gradio Demo
echo  ==========================
echo  Server: %GRADIO_SERVER_NAME%:%GRADIO_SERVER_PORT%
echo  GPUs:   %LANCE_GPUS%
echo.
echo  Select launch mode:
echo  [1] Normal
echo  [2] Custom parameters
echo  [3] Launch with --fp8 only
echo.
set /p MODE="Enter (1, 2, or 3): "

if "%MODE%"=="1" (
    echo Launching...
    "%PYTHON%" "%SCRIPT%" --server-name %GRADIO_SERVER_NAME% --server-port %GRADIO_SERVER_PORT% --gpus %LANCE_GPUS%
) else if "%MODE%"=="2" (
    echo.
    echo  Available parameters:
    echo    --server-name   Server address (default: %GRADIO_SERVER_NAME%)
    echo    --server-port   Server port   (default: %GRADIO_SERVER_PORT%)
    echo    --gpus          GPU IDs       (default: %LANCE_GPUS%, e.g. 0,1,2,3)
    echo    --queue-size    Max queue     (default: auto)
    echo    --fp8           Use fp8_e4m3fn weights (~50%% VRAM savings)
    echo.
    set /p CUSTOM_ARGS="Enter additional arguments: "
    echo Launching with custom args...
    "%PYTHON%" "%SCRIPT%" --server-name %GRADIO_SERVER_NAME% --server-port %GRADIO_SERVER_PORT% --gpus %LANCE_GPUS% %CUSTOM_ARGS%
) else if "%MODE%"=="3" (
    echo Launching with fp8...
    "%PYTHON%" "%SCRIPT%" --server-name %GRADIO_SERVER_NAME% --server-port %GRADIO_SERVER_PORT% --gpus %LANCE_GPUS% --fp8
) else (
    echo Invalid choice.
    pause
    exit /b 1
)

endlocal
