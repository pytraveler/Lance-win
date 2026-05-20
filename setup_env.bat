@echo off
setlocal enabledelayedexpansion

set UV_TAG_DEFAULT=0.11.15
set UV_TAG=%UV_TAG_DEFAULT%
set CLEAR_VENV=0
set UV_ZIP=uv_tmp.zip
set UV_TMPDIR=_uv_tmp

:parse_args
if "%~1"=="" goto end_parse
if /i "%~1"=="--uv-tag" (
    set UV_TAG=%~2
    shift
    shift
    goto parse_args
)
if /i "%~1"=="--clear-venv" (
    set CLEAR_VENV=1
    shift
    goto parse_args
)
shift
goto parse_args
:end_parse

echo ================================================================
echo  Lance Windows Environment Setup
echo  uv tag : %UV_TAG%
echo  clear  : %CLEAR_VENV%
echo ================================================================
echo.

:: ==================================================================
:: Step 1: Download uv.exe (conditional)
:: ==================================================================
set NEED_UV_DOWNLOAD=0
if not exist "uv.exe" (
    set NEED_UV_DOWNLOAD=1
) else (
    if not "%UV_TAG%"=="%UV_TAG_DEFAULT%" (
        set NEED_UV_DOWNLOAD=1
    )
)

if "!NEED_UV_DOWNLOAD!"=="1" (
    echo [1/5] Downloading uv %UV_TAG%...
    set UV_URL=https://releases.astral.sh/github/uv/releases/download/!UV_TAG!/uv-x86_64-pc-windows-msvc.zip
    curl.exe -L -f -o "%UV_ZIP%" "!UV_URL!"
    if errorlevel 1 (
        echo [ERROR] Failed to download uv.
        goto cleanup_and_exit
    )

    echo [1/5] Extracting uv.exe...
    if exist "%UV_TMPDIR%" rmdir /s /q "%UV_TMPDIR%"
    powershell -NoProfile -Command "Expand-Archive -LiteralPath '%UV_ZIP%' -DestinationPath '%UV_TMPDIR%' -Force"
    if errorlevel 1 (
        echo [ERROR] Failed to extract uv archive.
        goto cleanup_and_exit
    )

    copy /y "%UV_TMPDIR%\uv.exe" ".\uv.exe" >nul
    if errorlevel 1 (
        echo [ERROR] Failed to copy uv.exe.
        goto cleanup_and_exit
    )

    if exist "%UV_TMPDIR%" rmdir /s /q "%UV_TMPDIR%"
    if exist "%UV_ZIP%" del /f /q "%UV_ZIP%"
    echo [1/5] uv.exe installed ^(v%UV_TAG%^).
) else (
    echo [1/5] uv.exe already present, skipping download.
)
echo.

:: ==================================================================
:: Step 2: Pin Python version
:: ==================================================================
echo [2/5] Pinning Python 3.11...
uv.exe python pin 3.11
if errorlevel 1 (
    echo [ERROR] Failed to pin Python version.
    goto cleanup_and_exit
)
echo.

:: ==================================================================
:: Step 3: Create virtual environment
:: ==================================================================
if "%CLEAR_VENV%"=="1" (
    if exist ".venv" (
        echo [3/5] Removing existing .venv...
        rmdir /s /q ".venv"
    )
)

echo [3/5] Creating virtual environment...
uv.exe venv
if errorlevel 1 (
    echo [ERROR] Failed to create virtual environment.
    goto cleanup_and_exit
)
echo.

:: ==================================================================
:: Step 4: Install packages (same order as setup_env.sh)
:: ==================================================================
echo [4/5] Uninstalling pynvml...
uv.exe pip uninstall pynvml 2>nul
echo.

echo [4/5] Filtering Linux-only packages from requirements.txt...
set REQ_WIN=requirements-windows.txt
findstr /v /i /c:"triton==" /c:"flash-attn==" requirements.txt > !REQ_WIN!
echo [4/5] Installing from !REQ_WIN!...
uv.exe pip install -r !REQ_WIN!
if errorlevel 1 (
    echo [ERROR] Failed to install requirements.
    goto cleanup_and_exit
)
del /f /q "!REQ_WIN!" 2>nul
echo.

echo [4/5] Installing triton 3.2.0 (Windows wheel)...
set TRITON_WHL=triton-3.2.0-cp311-cp311-win_amd64.whl
set TRITON_URL=https://github.com/woct0rdho/triton-windows/releases/download/v3.2.0-windows.post10/!TRITON_WHL!
curl.exe -L -f -o "!TRITON_WHL!" "!TRITON_URL!"
if errorlevel 1 (
    echo [ERROR] Failed to download triton wheel.
    goto cleanup_and_exit
)
uv.exe pip install "!TRITON_WHL!"
if errorlevel 1 (
    echo [ERROR] Failed to install triton.
    del /f /q "!TRITON_WHL!" 2>nul
    goto cleanup_and_exit
)
del /f /q "!TRITON_WHL!" 2>nul
echo.

echo [4/5] Installing transformers==4.49.0...
uv.exe pip install transformers==4.49.0
if errorlevel 1 (
    echo [ERROR] Failed to install transformers.
    goto cleanup_and_exit
)
echo.

echo [4/5] Installing diffusers==0.29.1...
uv.exe pip install diffusers==0.29.1
if errorlevel 1 (
    echo [ERROR] Failed to install diffusers.
    goto cleanup_and_exit
)
echo.

echo [4/5] Installing torch==2.7.0+cu128, torchvision==0.22.0+cu128, torchaudio==2.7.0+cu128...
uv.exe pip install torch==2.7.0+cu128 torchvision==0.22.0+cu128 torchaudio==2.7.0+cu128 --index-url https://download.pytorch.org/whl/cu128
if errorlevel 1 (
    echo [ERROR] Failed to install torch packages.
    goto cleanup_and_exit
)
echo.

echo [4/5] Installing flash-attn 2.7.4.post1 (Windows cu128 wheel)...
set FLASH_ATTN_WHL=flash_attn-2.7.4.post1+cu128torch2.7.0cxx11abiFALSE-cp311-cp311-win_amd64.whl
set FLASH_ATTN_URL=https://github.com/kingbri1/flash-attention/releases/download/v2.7.4.post1/!FLASH_ATTN_WHL!
curl.exe -L -f -o "!FLASH_ATTN_WHL!" "!FLASH_ATTN_URL!"
if errorlevel 1 (
    echo [ERROR] Failed to download flash-attn wheel.
    goto cleanup_and_exit
)
uv.exe pip install "!FLASH_ATTN_WHL!"
if errorlevel 1 (
    echo [ERROR] Failed to install flash-attn.
    del /f /q "!FLASH_ATTN_WHL!" 2>nul
    goto cleanup_and_exit
)
del /f /q "!FLASH_ATTN_WHL!" 2>nul
echo.

echo [4/5] Installing gradio==5.35...
uv.exe pip install "gradio==5.35"
if errorlevel 1 (
    echo [ERROR] Failed to install gradio.
    goto cleanup_and_exit
)
echo.

:: ==================================================================
:: Step 5: Download model weights from HuggingFace
:: ==================================================================
if not exist "downloads\Lance_3B_Video\llm_config.json" (
    echo [5/5] Downloading model weights from HuggingFace...
    echo       This may take a long time depending on your connection.
    uv.exe pip install huggingface_hub
    if errorlevel 1 (
        echo [ERROR] Failed to install huggingface_hub.
        goto cleanup_and_exit
    )
    uv.exe run huggingface-cli download bytedance-research/Lance Lance_3B_Video/ Qwen2.5-VL-ViT/ Wan2.2_VAE.pth --local-dir downloads --local-dir-use-symlinks False
    if errorlevel 1 (
        echo [ERROR] Failed to download model weights.
        goto cleanup_and_exit
    )
) else (
    echo [5/5] Model weights already present, skipping download.
)
echo.

:: ==================================================================
:: Done
:: ==================================================================
echo ================================================================
echo  All packages installed successfully.
echo ================================================================
endlocal
exit /b 0

:cleanup_and_exit
if exist "%UV_TMPDIR%" rmdir /s /q "%UV_TMPDIR%" 2>nul
if exist "%UV_ZIP%" del /f /q "%UV_ZIP%" 2>nul
if exist "requirements-windows.txt" del /f /q "requirements-windows.txt" 2>nul
if exist "flash_attn-2.7.4.post1+cu128torch2.7.0cxx11abiFALSE-cp311-cp311-win_amd64.whl" del /f /q "flash_attn-2.7.4.post1+cu128torch2.7.0cxx11abiFALSE-cp311-cp311-win_amd64.whl" 2>nul
if exist "triton-3.2.0-cp311-cp311-win_amd64.whl" del /f /q "triton-3.2.0-cp311-cp311-win_amd64.whl" 2>nul
endlocal
exit /b 1
