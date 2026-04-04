# Installation script for Windows (PowerShell)
# Installs dotfiles to the corresponding directories

# Get the base directory of the script
$DOTFILES_DIR = Split-Path -Parent $MyInvocation.MyCommand.Definition

Write-Host "`n===== Starting dotfiles installation =====" -ForegroundColor Cyan
Write-Host ""

# 1. Install backgrounds
Write-Host "[1] Installing backgrounds..." -ForegroundColor Yellow
$BACKGROUNDS_SRC = "$DOTFILES_DIR\.config\backgrounds"
$BACKGROUNDS_DEST = "$env:USERPROFILE\Pictures\Backgrounds"

if (Test-Path $BACKGROUNDS_SRC) {
    if (-not (Test-Path $BACKGROUNDS_DEST)) {
        New-Item -ItemType Directory -Path $BACKGROUNDS_DEST -Force | Out-Null
    }
    Copy-Item -Path "$BACKGROUNDS_SRC\*" -Destination $BACKGROUNDS_DEST -Force -Recurse
    Write-Host "✓ Backgrounds installed in $BACKGROUNDS_DEST" -ForegroundColor Green
    Write-Host ""
} else {
    Write-Host "✗ Backgrounds folder not found" -ForegroundColor Yellow
    Write-Host ""
}

# 2. Install VS Code configuration
Write-Host "[2] Installing VS Code configuration..." -ForegroundColor Yellow
$VSCODE_CONFIG_DIR = "$env:APPDATA\Code\User"

if (-not (Test-Path $VSCODE_CONFIG_DIR)) {
    New-Item -ItemType Directory -Path $VSCODE_CONFIG_DIR -Force | Out-Null
}

# Copy settings.json
if (Test-Path "$DOTFILES_DIR\.config\vscode\settings.json") {
    Copy-Item -Path "$DOTFILES_DIR\.config\vscode\settings.json" -Destination "$VSCODE_CONFIG_DIR\settings.json" -Force
    Write-Host "✓ settings.json installed" -ForegroundColor Green
    Write-Host ""
} else {
    Write-Host "✗ settings.json not found" -ForegroundColor Yellow
    Write-Host ""
}

# 3. Install VS Code profiles
Write-Host "[3] Installing VS Code profiles..." -ForegroundColor Yellow
$VSCODE_PROFILES_SRC = "$DOTFILES_DIR\.config\vscode\profiles"
$VSCODE_PROFILES_DEST = "$VSCODE_CONFIG_DIR\profiles"

if (Test-Path $VSCODE_PROFILES_SRC) {
    if (-not (Test-Path $VSCODE_PROFILES_DEST)) {
        New-Item -ItemType Directory -Path $VSCODE_PROFILES_DEST -Force | Out-Null
    }
    Copy-Item -Path "$VSCODE_PROFILES_SRC\*" -Destination $VSCODE_PROFILES_DEST -Force -Recurse
    Write-Host "✓ Profiles installed in $VSCODE_PROFILES_DEST" -ForegroundColor Green
    Write-Host ""
} else {
    Write-Host "✗ Profiles folder not found" -ForegroundColor Yellow
    Write-Host ""
}

Write-Host "===== Installation completed =====" -ForegroundColor Green
Write-Host ""
Write-Host "VS Code configuration directory: $VSCODE_CONFIG_DIR" -ForegroundColor Cyan
Write-Host "Backgrounds directory: $BACKGROUNDS_DEST" -ForegroundColor Cyan
Write-Host ""
