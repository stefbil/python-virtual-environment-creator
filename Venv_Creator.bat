@echo off
setlocal EnableDelayedExpansion

:: Prompt user for environment name
set /p env_name=Enter environment name: 

if not defined env_name (
    echo Error: environment name is required.
    goto end
)

:: Prompt user for virtual environment destination directory
set /p env_dir=Enter virtual environment destination directory: 

if not defined env_dir (
    echo Error: virtual environment destination directory is required.
    goto end
)

:: Create virtual environment
python -m venv "%env_dir%\%env_name%"

:: Activate virtual environment and open new command prompt window in virtual environment directory
cmd /k "cd /d "%env_dir%" & call "%env_dir%\%env_name%\Scripts\activate.bat""

:end
