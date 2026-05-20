@echo off
setlocal enabledelayedexpansion

cd /d "%~dp0"

REM ========================= Inference Parameters =========================
if not defined NUM_GPUS       set "NUM_GPUS=1"
if not defined TASK_NAME      set "TASK_NAME=x2t_image"

if not defined VALIDATION_NUM_TIMESTEPS  set "VALIDATION_NUM_TIMESTEPS=30"
if not defined VALIDATION_TIMESTEP_SHIFT set "VALIDATION_TIMESTEP_SHIFT=3.5"
if not defined VALIDATION_DATA_SEED      set "VALIDATION_DATA_SEED=42"
if not defined CFG_TEXT_SCALE            set "CFG_TEXT_SCALE=4.0"
if not defined USE_KVCACHE               set "USE_KVCACHE=true"

if not defined NUM_FRAMES     set "NUM_FRAMES=50"
if not defined VIDEO_HEIGHT   set "VIDEO_HEIGHT=768"
if not defined VIDEO_WIDTH    set "VIDEO_WIDTH=768"
if not defined RESOLUTION     set "RESOLUTION=video_480p"
if not defined TEXT_TEMPLATE  set "TEXT_TEMPLATE=true"

if not defined MODEL_PATH     set "MODEL_PATH=downloads/Lance_3B_Video"

REM ========================= Command-line Arguments =========================
:parse_args
if "%~1"=="" goto end_parse
if /i "%~1"=="--NUM_GPUS"      ( set "NUM_GPUS=%~2"                  & shift & shift & goto parse_args )
if /i "%~1"=="--TASK_NAME"     ( set "TASK_NAME=%~2"                 & shift & shift & goto parse_args )
if /i "%~1"=="--MODEL_PATH"    ( set "MODEL_PATH=%~2"                & shift & shift & goto parse_args )
if /i "%~1"=="--VALIDATION_NUM_TIMESTEPS"  ( set "VALIDATION_NUM_TIMESTEPS=%~2"  & shift & shift & goto parse_args )
if /i "%~1"=="--VALIDATION_TIMESTEP_SHIFT" ( set "VALIDATION_TIMESTEP_SHIFT=%~2" & shift & shift & goto parse_args )
if /i "%~1"=="--VALIDATION_DATA_SEED"      ( set "VALIDATION_DATA_SEED=%~2"      & shift & shift & goto parse_args )
if /i "%~1"=="--CFG_TEXT_SCALE"            ( set "CFG_TEXT_SCALE=%~2"            & shift & shift & goto parse_args )
if /i "%~1"=="--USE_KVCACHE"               ( set "USE_KVCACHE=%~2"              & shift & shift & goto parse_args )
if /i "%~1"=="--NUM_FRAMES"     ( set "NUM_FRAMES=%~2"    & shift & shift & goto parse_args )
if /i "%~1"=="--VIDEO_HEIGHT"   ( set "VIDEO_HEIGHT=%~2"  & shift & shift & goto parse_args )
if /i "%~1"=="--VIDEO_WIDTH"    ( set "VIDEO_WIDTH=%~2"   & shift & shift & goto parse_args )
if /i "%~1"=="--RESOLUTION"     ( set "RESOLUTION=%~2"    & shift & shift & goto parse_args )
if /i "%~1"=="--TEXT_TEMPLATE"  ( set "TEXT_TEMPLATE=%~2" & shift & shift & goto parse_args )
if /i "%~1"=="--SAVE_PATH_GEN"  ( set "SAVE_PATH_GEN=%~2" & shift & shift & goto parse_args )
if /i "%~1"=="-h"   goto show_help
if /i "%~1"=="--help" goto show_help

echo Unknown option: %~1
echo Use -h or --help for usage.
exit /b 1

:show_help
echo Usage: inference_lance.bat [OPTIONS]
echo.
echo Example:
echo   inference_lance.bat --TASK_NAME t2i --MODEL_PATH downloads/Lance_3B --RESOLUTION image_768res
exit /b 0

:end_parse

REM ========================= Auto-generated Paths =========================
for /f %%t in ('powershell -NoProfile -Command "Get-Date -Format yyyyMMdd_HHmmss"') do set "TIMESTAMP=%%t"

set "KVCACHE_TAG="
if /i "%USE_KVCACHE%"=="true" set "KVCACHE_TAG=_kvcache"

if not defined SAVE_PATH_GEN (
    set "SAVE_PATH_GEN=results/%TASK_NAME%_sample_ts%VALIDATION_NUM_TIMESTEPS%_tts%VALIDATION_TIMESTEP_SHIFT%_seed%VALIDATION_DATA_SEED%_cfg%CFG_TEXT_SCALE%%KVCACHE_TAG%_%TIMESTAMP%"
)

if not defined MODEL_PATH (
    echo Error: please set MODEL_PATH manually in the configuration section at the top of this script.
    exit /b 1
)

REM ========================= Environment and Distributed Setup =========================
call :lance_setup_common_env
call :lance_setup_distributed_env %NUM_GPUS%
call :lance_setup_shard_env 1

REM ========================= Show Task Configuration =========================
echo ================================================
echo Lance Inference
echo ================================================
echo Task: %TASK_NAME%
echo Number of GPUs: %NUM_GPUS%
echo Save path: %SAVE_PATH_GEN%
echo Resolution: %VIDEO_HEIGHT%x%VIDEO_WIDTH%
echo Output frames: %NUM_FRAMES%
echo Model path: %MODEL_PATH%
echo.
echo Key parameters:
echo   - validation_num_timesteps: %VALIDATION_NUM_TIMESTEPS%
echo   - validation_timestep_shift: %VALIDATION_TIMESTEP_SHIFT%
echo   - validation_data_seed: %VALIDATION_DATA_SEED%
echo   - cfg_text_scale: %CFG_TEXT_SCALE%
echo   - num_frames: %NUM_FRAMES%
echo   - use_KVcache: %USE_KVCACHE%
echo ================================================
echo.

REM ========================= Run Inference =========================
accelerate launch ^
    --num_machines          %NUM_MACHINES% ^
    --num_processes         %TOTAL_RANK% ^
    --machine_rank          %MACHINE_RANK% ^
    --main_process_ip       %MAIN_PROCESS_IP% ^
    --main_process_port     %MAIN_PROCESS_PORT% ^
    --mixed_precision       bf16 ^
    inference_lance.py ^
    --model_path            "%MODEL_PATH%" ^
    --vit_type              qwen_2_5_vl_original ^
    --llm_qk_norm           true ^
    --llm_qk_norm_und       true ^
    --llm_qk_norm_gen       true ^
    --tie_word_embeddings   false ^
    --validation_num_timesteps %VALIDATION_NUM_TIMESTEPS% ^
    --validation_timestep_shift %VALIDATION_TIMESTEP_SHIFT% ^
    --copy_init_moe         true ^
    --max_num_frames        121 ^
    --max_latent_size       64 ^
    --latent_patch_size     1 1 1 ^
    --visual_und            true ^
    --visual_gen            true ^
    --vae_model_type        wan ^
    --apply_qwen_2_5_vl_pos_emb true ^
    --apply_chat_template   false ^
    --cfg_type              0 ^
    --validation_data_seed  %VALIDATION_DATA_SEED% ^
    --video_height          %VIDEO_HEIGHT% ^
    --video_width           %VIDEO_WIDTH% ^
    --num_frames            %NUM_FRAMES% ^
    --task                  %TASK_NAME% ^
    --save_path_gen         "%SAVE_PATH_GEN%" ^
    --resolution            "%RESOLUTION%" ^
    --text_template         "%TEXT_TEMPLATE%" ^
    --cfg_text_scale        %CFG_TEXT_SCALE% ^
    --use_KVcache           "%USE_KVCACHE%"

echo.
echo ================================================
echo Done! Results: %SAVE_PATH_GEN%
echo ================================================

endlocal
exit /b 0

REM ====================================================================
REM  Helper subroutines  (translated from benchmarks/sample_env.sh)
REM
REM  Batch does not support cross-file "source" — variables set in a
REM  child batch file are lost on return — so all functions are inlined
REM  here and invoked with  call :label .
REM ====================================================================

REM ------------------------------------------------------------------
REM  find_available_port  start_port  [end_port]
REM  Sets FIND_PORT_RESULT to the first free TCP port found.
REM ------------------------------------------------------------------
:find_available_port
set "FA_START=%~1"
if not defined FA_START set "FA_START=6666"
set "FA_END=%~2"
if not defined FA_END set "FA_END=8888"

set "FA_PY=%TEMP%\_find_port_%RANDOM%.py"
echo import socket, sys>"%FA_PY%"
echo for port in range(int(sys.argv[1]), int(sys.argv[2])):>>"%FA_PY%"
echo     try:>>"%FA_PY%"
echo         s = socket.socket()>>"%FA_PY%"
echo         s.bind(('', port))>>"%FA_PY%"
echo         s.close()>>"%FA_PY%"
echo         print(port)>>"%FA_PY%"
echo         break>>"%FA_PY%"
echo     except OSError:>>"%FA_PY%"
echo         pass>>"%FA_PY%"
echo else:>>"%FA_PY%"
echo     print(int(sys.argv[1]))>>"%FA_PY%"
for /f %%p in ('python "%FA_PY%" %FA_START% %FA_END%') do set "FIND_PORT_RESULT=%%p"
del /f /q "%FA_PY%" 2>nul
goto :eof

REM ------------------------------------------------------------------
REM  lance_setup_common_env
REM ------------------------------------------------------------------
:lance_setup_common_env
if not defined EXP_HW_20250819 set "EXP_HW_20250819=False"
echo EXP_HW_20250819: %EXP_HW_20250819%

if not defined POSITION_EMBEDDING_3D_VERSION set "POSITION_EMBEDDING_3D_VERSION=v2"
echo (shell) POSITION_EMBEDDING_3D_VERSION: %POSITION_EMBEDDING_3D_VERSION%

if not defined CUDA_LAUNCH_BLOCKING set "CUDA_LAUNCH_BLOCKING=0"
if not defined NCCL_DEBUG set "NCCL_DEBUG=VERSION"
if not defined TORCH_NCCL_HEARTBEAT_TIMEOUT_SEC set "TORCH_NCCL_HEARTBEAT_TIMEOUT_SEC=900"
goto :eof

REM ------------------------------------------------------------------
REM  lance_setup_distributed_env  [num_gpus]
REM ------------------------------------------------------------------
:lance_setup_distributed_env
set "DIST_NUM_GPUS=%~1"
if not defined DIST_NUM_GPUS set "DIST_NUM_GPUS=1"
set "NUM_GPUS=%DIST_NUM_GPUS%"

set "HAS_EXPLICIT_MAIN_PROCESS_PORT=0"
if defined MAIN_PROCESS_PORT set "HAS_EXPLICIT_MAIN_PROCESS_PORT=1"

if defined ARNOLD_WORKER_NUM (
    echo Using platform distributed environment

    if not defined NUM_MACHINES set "NUM_MACHINES=%ARNOLD_WORKER_NUM%"

    if not defined MACHINE_RANK (
        if defined ARNOLD_ID ( set "MACHINE_RANK=%ARNOLD_ID%" ) else set "MACHINE_RANK=0"
    )

    if not defined MAIN_PROCESS_IP (
        if defined ARNOLD_WORKER_0_HOST ( set "MAIN_PROCESS_IP=%ARNOLD_WORKER_0_HOST%" ) else set "MAIN_PROCESS_IP=127.0.0.1"
    )

    set "DEFAULT_MAIN_PROCESS_PORT=6666"
    if defined ARNOLD_WORKER_0_PORT set "DEFAULT_MAIN_PROCESS_PORT=%ARNOLD_WORKER_0_PORT%"

    if "!HAS_EXPLICIT_MAIN_PROCESS_PORT!"=="1" (
        rem port already set
    ) else if "!NUM_MACHINES!"=="1" (
        set /a FA_END=DEFAULT_MAIN_PROCESS_PORT+500
        call :find_available_port !DEFAULT_MAIN_PROCESS_PORT! !FA_END!
        set "MAIN_PROCESS_PORT=!FIND_PORT_RESULT!"
    ) else (
        set "MAIN_PROCESS_PORT=!DEFAULT_MAIN_PROCESS_PORT!"
        echo Multi-machine task using platform rendezvous port: !MAIN_PROCESS_PORT!
    )
) else (
    echo Using local or explicitly configured distributed environment

    if not defined NUM_MACHINES set "NUM_MACHINES=1"
    if not defined MACHINE_RANK set "MACHINE_RANK=0"
    if not defined MAIN_PROCESS_IP set "MAIN_PROCESS_IP=127.0.0.1"

    set "DEFAULT_MAIN_PROCESS_PORT=6666"

    if "!HAS_EXPLICIT_MAIN_PROCESS_PORT!"=="1" (
        rem port already set
    ) else (
        set /a FA_END=DEFAULT_MAIN_PROCESS_PORT+500
        call :find_available_port !DEFAULT_MAIN_PROCESS_PORT! !FA_END!
        set "MAIN_PROCESS_PORT=!FIND_PORT_RESULT!"
    )
)

set /a TOTAL_RANK=NUM_MACHINES*NUM_GPUS

echo NUM_MACHINES: %NUM_MACHINES%
echo NUM_GPUS: %NUM_GPUS%
echo TOTAL_RANK: %TOTAL_RANK%
echo MACHINE_RANK: %MACHINE_RANK%
echo MAIN_PROCESS_IP: %MAIN_PROCESS_IP%
echo MAIN_PROCESS_PORT: %MAIN_PROCESS_PORT%
goto :eof

REM ------------------------------------------------------------------
REM  lance_setup_shard_env  [num_shard]
REM ------------------------------------------------------------------
:lance_setup_shard_env
set "NUM_SHARD=%~1"
if not defined NUM_SHARD set "NUM_SHARD=1"

set /a NUM_REPLICATE=TOTAL_RANK/NUM_SHARD

echo NUM_REPLICATE: %NUM_REPLICATE%
echo NUM_SHARD: %NUM_SHARD%
goto :eof
