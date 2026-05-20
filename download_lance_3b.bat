@echo off
setlocal enabledelayedexpansion

echo ================================================================
echo  Lance_3B Model Downloader
echo  Repo : bytedance-research/Lance
echo  Path : Lance_3B/
echo  Dest : downloads\Lance_3B\
echo ================================================================
echo.

:: Check if model is already present
if exist "downloads\Lance_3B\llm_config.json" (
    echo [INFO] Model weights already present in downloads\Lance_3B\, nothing to do.
    goto done
)

:: Ensure uv.exe exists
if not exist "uv.exe" (
    echo [ERROR] uv.exe not found in the current directory.
    echo         Run setup_env.bat first.
    goto fail
)

:: Ensure downloads directory exists
if not exist "downloads" mkdir "downloads"

echo [1/2] Installing huggingface_hub...
uv.exe pip install huggingface_hub
if errorlevel 1 (
    echo [ERROR] Failed to install huggingface_hub.
    goto fail
)
echo.

echo [2/2] Downloading Lance_3B model weights from HuggingFace...
echo       This may take a long time depending on your connection.
echo.
uv.exe run huggingface-cli download bytedance-research/Lance --include "Lance_3B/*" --local-dir downloads
if errorlevel 1 (
    echo [ERROR] Failed to download model weights.
    goto fail
)
echo.

:done
echo ================================================================
echo  Lance_3B model weights ready at downloads\Lance_3B\
echo ================================================================
endlocal
exit /b 0

:fail
endlocal
exit /b 1
