@echo off
setlocal enabledelayedexpansion

set UV_TAG_DEFAULT=0.11.15
set UV_TAG=%UV_TAG_DEFAULT%
set CLEAR_VENV=0
set LANCE_ZIP_URL=https://github.com/pytraveler/Lance-win/archive/refs/heads/main.zip
set LANCE_ZIP=lance_main.zip
set LANCE_TMPDIR=_lance_tmp
set UV_ZIP=uv_tmp.zip
set UV_TMPDIR=_uv_tmp
set REQ_FILE=requirements_pytorch126.txt

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
echo  Lance Windows Environment Setup (PyTorch 2.8.0 + CUDA 12.6)
echo  Author : Aleks aka pytraveler
echo  uv tag : %UV_TAG%
echo  clear  : %CLEAR_VENV%
echo ================================================================
echo.

:: ==================================================================
:: Step 1: Download and extract Lance project archive
:: ==================================================================
echo [1/5] Downloading Lance-win project archive...
curl.exe -L -f -o "%LANCE_ZIP%" "%LANCE_ZIP_URL%"
if errorlevel 1 (
    echo [ERROR] Failed to download Lance archive.
    goto cleanup_and_exit
)

echo [1/5] Extracting Lance project...
if exist "%LANCE_TMPDIR%" rmdir /s /q "%LANCE_TMPDIR%"
powershell -NoProfile -Command "Expand-Archive -LiteralPath '%LANCE_ZIP%' -DestinationPath '%LANCE_TMPDIR%' -Force"
if errorlevel 1 (
    echo [ERROR] Failed to extract Lance archive.
    goto cleanup_and_exit
)

echo [1/5] Copying files to project root...
echo setup_env_torch28cuda126.bat> "%TEMP%\_xcopy_exclude.txt"
echo _patch_vit.ps1>> "%TEMP%\_xcopy_exclude.txt"
echo download_lance_3b.bat>> "%TEMP%\_xcopy_exclude.txt"
echo inference_lance.bat>> "%TEMP%\_xcopy_exclude.txt"
echo lance_download_models.bat>> "%TEMP%\_xcopy_exclude.txt"
echo lance_download_models.py>> "%TEMP%\_xcopy_exclude.txt"
echo lance_download_models.py>> "%TEMP%\_xcopy_exclude.txt"
echo lance_gradio_image.py>> "%TEMP%\_xcopy_exclude.txt"
echo lance_gradio_video.py>> "%TEMP%\_xcopy_exclude.txt"
echo run_gradio_image.bat>> "%TEMP%\_xcopy_exclude.txt"
echo run_gradio_video.bat>> "%TEMP%\_xcopy_exclude.txt"
echo lance_gradio.py>> "%TEMP%\_xcopy_exclude.txt"
xcopy "%LANCE_TMPDIR%\Lance-win-main\*" "." /s /y /q /exclude:%TEMP%\_xcopy_exclude.txt
if errorlevel 1 (
    del /f /q "%TEMP%\_xcopy_exclude.txt" 2>nul
    echo [ERROR] Failed to copy Lance files.
    goto cleanup_and_exit
)
del /f /q "%TEMP%\_xcopy_exclude.txt" 2>nul

if exist "%LANCE_TMPDIR%" rmdir /s /q "%LANCE_TMPDIR%"
if exist "%LANCE_ZIP%" del /f /q "%LANCE_ZIP%"
echo [1/5] Done.
echo.

:: ==================================================================
:: Step 1b: Patch qwen2_5_vl_vit.py for Windows compatibility
::   Replaces flash_attn RoPE (needs Triton/C compiler) with
::   pure-PyTorch implementation from pytraveler/Lance-win.
:: ==================================================================
if exist "_patch_vit.ps1" (
    echo [1/5] Patching qwen2_5_vl_vit.py for Windows compatibility...
    powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0_patch_vit.ps1"
    if errorlevel 1 (
        echo [WARN] Patch failed. Continuing anyway.
    )
)
echo.

:: ==================================================================
:: Step 2: Download uv.exe (conditional)
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
    echo [2/5] Downloading uv %UV_TAG%...
    set UV_URL=https://releases.astral.sh/github/uv/releases/download/!UV_TAG!/uv-x86_64-pc-windows-msvc.zip
    curl.exe -L -f -o "%UV_ZIP%" "!UV_URL!"
    if errorlevel 1 (
        echo [ERROR] Failed to download uv.
        goto cleanup_and_exit
    )

    echo [2/5] Extracting uv.exe...
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
    echo [2/5] uv.exe installed ^(v%UV_TAG%^).
) else (
    echo [2/5] uv.exe already present, skipping download.
)
echo.

:: ==================================================================
:: Step 3: Pin Python version
:: ==================================================================
echo [3/5] Pinning Python 3.11...
uv.exe python pin 3.11
if errorlevel 1 (
    echo [ERROR] Failed to pin Python version.
    goto cleanup_and_exit
)
echo.

:: ==================================================================
:: Step 4: Create virtual environment
:: ==================================================================
if "%CLEAR_VENV%"=="1" (
    if exist ".venv" (
        echo [4/5] Removing existing .venv...
        rmdir /s /q ".venv"
    )
)

if exist ".venv" (
    echo [4/5] Virtual environment already exists, skipping creation.
) else (
    echo [4/5] Creating virtual environment...
    uv.exe venv
    if errorlevel 1 (
        echo [ERROR] Failed to create virtual environment.
        goto cleanup_and_exit
    )
)
echo.

:: ==================================================================
:: Step 5: Install packages (same order as setup_env.sh)
:: ==================================================================
echo [5/5] Uninstalling pynvml...
uv.exe pip uninstall pynvml 2>nul
echo.

echo [5/5] Filtering Linux-only packages from %REQ_FILE%...
set REQ_WIN=requirements-windows.txt
findstr /v /i /c:"triton==" /c:"flash-attn==" /c:"torch==" /c:"torchvision==" /c:"torchaudio==" %REQ_FILE% > !REQ_WIN!
echo [5/5] Installing from !REQ_WIN!...
uv.exe pip install -r !REQ_WIN!
if errorlevel 1 (
    echo [ERROR] Failed to install requirements.
    goto cleanup_and_exit
)
del /f /q "!REQ_WIN!" 2>nul
echo.

echo [5/5] Installing triton-windows >=3.4.0,<3.5...
uv.exe pip install "triton-windows>=3.4.0,<3.5"
if errorlevel 1 (
    echo [ERROR] Failed to install triton-windows.
    goto cleanup_and_exit
)
echo.

echo [5/5] Installing transformers==4.49.0...
uv.exe pip install transformers==4.49.0
if errorlevel 1 (
    echo [ERROR] Failed to install transformers.
    goto cleanup_and_exit
)
echo.

echo [5/5] Installing diffusers==0.29.1...
uv.exe pip install diffusers==0.29.1
if errorlevel 1 (
    echo [ERROR] Failed to install diffusers.
    goto cleanup_and_exit
)
echo.

:: Check torch version before installing (avoid re-downloading large packages)
uv.exe pip show torch > "%TEMP%\_torchinfo.txt" 2>nul
findstr "2.8.0+cu126" "%TEMP%\_torchinfo.txt" >nul 2>nul
if errorlevel 1 (
    echo [5/5] Installing torch==2.8.0+cu126, torchvision==0.23.0+cu126, torchaudio==2.8.0+cu126...
    uv.exe pip install torch==2.8.0+cu126 torchvision==0.23.0+cu126 torchaudio==2.8.0+cu126 --index-url https://download.pytorch.org/whl/cu126
    if errorlevel 1 (
        echo [ERROR] Failed to install torch packages.
        del /f /q "%TEMP%\_torchinfo.txt" 2>nul
        goto cleanup_and_exit
    )
) else (
    echo [5/5] torch==2.8.0+cu126 already installed, skipping.
)
del /f /q "%TEMP%\_torchinfo.txt" 2>nul
echo.

echo [5/5] Installing flash-attn 2.8.3 (Windows cu128torch2.8.0 wheel)...
echo         NOTE: CUDA 12.8 wheel is used because a Windows cu126 wheel is not available.
echo         CUDA 12.8 runtime is backward-compatible with CUDA 12.6 drivers.
set FLASH_ATTN_WHL=flash_attn-2.8.3+cu128torch2.8.0cxx11abiFALSE-cp311-cp311-win_amd64.whl
set FLASH_ATTN_URL=https://github.com/kingbri1/flash-attention/releases/download/v2.8.3/!FLASH_ATTN_WHL!
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

echo [5/5] Installing gradio==5.35...
uv.exe pip install "gradio==5.35"
if errorlevel 1 (
    echo [ERROR] Failed to install gradio.
    goto cleanup_and_exit
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

:: ==================================================================
:: Subroutines
:: ==================================================================

:cleanup_and_exit
if exist "%LANCE_TMPDIR%" rmdir /s /q "%LANCE_TMPDIR%" 2>nul
if exist "%LANCE_ZIP%" del /f /q "%LANCE_ZIP%" 2>nul
if exist "%UV_TMPDIR%" rmdir /s /q "%UV_TMPDIR%" 2>nul
if exist "%UV_ZIP%" del /f /q "%UV_ZIP%" 2>nul
if exist "requirements-windows.txt" del /f /q "requirements-windows.txt" 2>nul
if exist "flash_attn-2.8.3+cu128torch2.8.0cxx11abiFALSE-cp311-cp311-win_amd64.whl" del /f /q "flash_attn-2.8.3+cu128torch2.8.0cxx11abiFALSE-cp311-cp311-win_amd64.whl" 2>nul
endlocal
exit /b 1
