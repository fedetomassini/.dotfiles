# Dotfiles Installation Scripts

This directory contains scripts to automatically install dotfiles configuration on Linux, macOS, and Windows.

## Contents to be installed

- **Backgrounds**: Wallpaper images saved to:
  - 📁 Linux: `~/.local/share/pixmaps`
  - 📁 macOS: `~/Library/Application Support/pixmaps`
  - 📁 Windows: `%USERPROFILE%\Pictures\Backgrounds`

- **VS Code Configuration**:
  - `settings.json`: General configuration
  - Profiles: Saved VS Code profiles

## Usage instructions

### 🐧 Linux / macOS

```bash
# Make the script executable
chmod +x install.sh

# Run the script
./install.sh
```

### 🪟 Windows

#### Option 1: Batch Script (Command Prompt)
```cmd
install.bat
```

#### Option 2: PowerShell (recommended)
```powershell
# If this is your first time running PowerShell scripts, you need to allow execution:
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

# Then run the script:
.\install.ps1
```

## Installation locations

### Linux/macOS
- VS Code Config: `~/.config/Code/User/` (Linux) or `~/Library/Application Support/Code/User/` (macOS)
- Backgrounds: `~/.local/share/pixmaps`

### Windows
- VS Code Config: `%APPDATA%\Code\User\`
- Backgrounds: `%USERPROFILE%\Pictures\Backgrounds\`

## Important notes

- ⚠️ The script will overwrite existing files without prompting
- ✓ All necessary directories are created automatically
- 🔒 It is recommended to backup your current VS Code configuration before running the scripts

## Directory structure

```
.config/
├── backgrounds/
│   ├── wallpaper-infection.png
│   ├── wallpaper-room.jpg
│   ├── wallpaper-room2.png
│   └── wallpaper-yqjdpd.png
└── vscode/
    ├── settings.json
    └── profiles/
        └── default.code-profile
```
