@echo off
REM Installation script for Windows
REM Installs dotfiles to the corresponding directories

setlocal enabledelayedexpansion

REM Get the base directory of the script
set DOTFILES_DIR=%~dp0

echo.
echo ===== Starting dotfiles installation =====
echo.

REM 1. Install backgrounds
echo [1] Installing backgrounds...
set BACKGROUNDS_SRC=%DOTFILES_DIR%.config\backgrounds
set BACKGROUNDS_DEST=%USERPROFILE%\Pictures\Backgrounds

if exist "%BACKGROUNDS_SRC%" (
    if not exist "%BACKGROUNDS_DEST%" mkdir "%BACKGROUNDS_DEST%"
    xcopy "%BACKGROUNDS_SRC%\*" "%BACKGROUNDS_DEST%\" /Y /I
    echo ✓ Backgrounds installed in %BACKGROUNDS_DEST%
    echo.
) else (
    echo ✗ Backgrounds folder not found
    echo.
)

REM 2. Install VS Code configuration
echo [2] Installing VS Code configuration...
set VSCODE_CONFIG_DIR=%APPDATA%\Code\User

if not exist "%VSCODE_CONFIG_DIR%" mkdir "%VSCODE_CONFIG_DIR%"

REM Copy settings.json
if exist "%DOTFILES_DIR%.config\vscode\settings.json" (
    copy "%DOTFILES_DIR%.config\vscode\settings.json" "%VSCODE_CONFIG_DIR%\settings.json" /Y
    echo ✓ settings.json installed
    echo.
) else (
    echo ✗ settings.json not found
    echo.
)

REM 3. Install VS Code profiles
echo [3] Installing VS Code profiles...
set VSCODE_PROFILES_SRC=%DOTFILES_DIR%.config\vscode\profiles
set VSCODE_PROFILES_DEST=%VSCODE_CONFIG_DIR%\profiles

if exist "%VSCODE_PROFILES_SRC%" (
    if not exist "%VSCODE_PROFILES_DEST%" mkdir "%VSCODE_PROFILES_DEST%"
    xcopy "%VSCODE_PROFILES_SRC%\*" "%VSCODE_PROFILES_DEST%\" /Y /I
    echo ✓ Profiles installed in %VSCODE_PROFILES_DEST%
    echo.
) else (
    echo ✗ Profiles folder not found
    echo.
)

echo ===== Installation completed =====
echo.
echo VS Code configuration directory: %VSCODE_CONFIG_DIR%
echo Backgrounds directory: %BACKGROUNDS_DEST%
echo.
pause
