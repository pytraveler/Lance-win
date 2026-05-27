@echo off
setlocal enabledelayedexpansion

if not exist "uv.exe" (
    echo [ERROR] uv.exe not found. Run setup_env.bat first.
    goto :eof
)
if not exist ".venv" (
    echo [ERROR] .venv not found. Run setup_env.bat first.
    goto :eof
)

uv.exe pip show huggingface_hub >nul 2>nul
if errorlevel 1 (
    echo Installing huggingface_hub...
    uv.exe pip install huggingface_hub
    if errorlevel 1 (
        echo [ERROR] Failed to install huggingface_hub.
        goto :eof
    )
    echo.
)

set HF_REPO=bytedance-research/Lance

:menu_loop
call :RefreshStatus
call :ShowMenu

set CHOICE=
set /p "CHOICE=  Select > "

if "!CHOICE!"=="" goto :menu_loop
if "!CHOICE!"=="0" goto :done
if "!CHOICE!"=="1" call :Download "Lance_3B_Video + Qwen2.5-VL-ViT + Wan2.2_VAE" "Lance_3B_Video/ Qwen2.5-VL-ViT/ Wan2.2_VAE.pth"
if "!CHOICE!"=="2" call :Download "Lance_3B + Qwen2.5-VL-ViT + Wan2.2_VAE" "Lance_3B/ Qwen2.5-VL-ViT/ Wan2.2_VAE.pth"
if "!CHOICE!"=="3" call :DownloadDir "Lance_3B_Video" "Lance_3B_Video/*"
if "!CHOICE!"=="4" call :DownloadDir "Lance_3B" "Lance_3B/*"
if "!CHOICE!"=="5" call :DownloadDir "Qwen2.5-VL-ViT" "Qwen2.5-VL-ViT/*"
if "!CHOICE!"=="6" call :Download "Wan2.2_VAE" "Wan2.2_VAE.pth"

echo.
pause
goto :menu_loop

:done
echo.
echo  Bye!
echo.
endlocal
exit /b 0

:: ==================================================================
:: Subroutines
:: ==================================================================

:RefreshStatus
set HAS_L3BV=0
set HAS_L3B=0
set HAS_VIT=0
set HAS_VAE=0
if exist "downloads\Lance_3B_Video\llm_config.json" set HAS_L3BV=1
if exist "downloads\Lance_3B\llm_config.json" set HAS_L3B=1
if exist "downloads\Qwen2.5-VL-ViT\config.json" set HAS_VIT=1
if exist "downloads\Wan2.2_VAE.pth" set HAS_VAE=1
goto :eof

:StatusStr
:: Sets _S to [OK] or [  ] based on variable named by %1
if !%~1!==1 (
    set _S=[OK]
) else (
    set _S=[  ]
)
goto :eof

:ShowMenu
echo.
echo ================================================================
echo   Lance Model Downloader
echo   Author : Aleks aka pytraveler
echo   Repo : %HF_REPO%
echo ================================================================
echo.
echo   Combined Sets:
echo.
call :StatusStr HAS_L3BV
set _S1=!_S!
call :StatusStr HAS_VIT
set _S2=!_S!
call :StatusStr HAS_VAE
set _S3=!_S!
echo   1^) Lance_3B_Video + Qwen2.5-VL-ViT + Wan2.2_VAE  !_S1! !_S2! !_S3!
call :StatusStr HAS_L3B
set _S1=!_S!
echo   2^) Lance_3B + Qwen2.5-VL-ViT + Wan2.2_VAE        !_S1! !_S2! !_S3!
echo.
echo   Individual Components:
echo.
call :StatusStr HAS_L3BV
echo   3^) Lance_3B_Video                                 !_S!
call :StatusStr HAS_L3B
echo   4^) Lance_3B                                       !_S!
call :StatusStr HAS_VIT
echo   5^) Qwen2.5-VL-ViT                                 !_S!
call :StatusStr HAS_VAE
echo   6^) Wan2.2_VAE                                     !_S!
echo.
echo   0^) Exit
echo.
goto :eof

:Download
echo.
echo ----------------------------------------------------------------
echo   Downloading: %~1
echo   This may take a long time depending on your connection.
echo ----------------------------------------------------------------
uv.exe run huggingface-cli download %HF_REPO% %~2 --local-dir downloads --local-dir-use-symlinks False >nul
if errorlevel 1 (
    echo.
    echo [ERROR] Failed to download %~1.
) else (
    echo.
    echo [OK] %~1 downloaded successfully.
)
goto :eof

:DownloadDir
echo.
echo ----------------------------------------------------------------
echo   Downloading: %~1
echo   This may take a long time depending on your connection.
echo ----------------------------------------------------------------
uv.exe run huggingface-cli download %HF_REPO% --include "%~2" --local-dir downloads --local-dir-use-symlinks False >nul
if errorlevel 1 (
    echo.
    echo [ERROR] Failed to download %~1.
) else (
    echo.
    echo [OK] %~1 downloaded successfully.
)
goto :eof
