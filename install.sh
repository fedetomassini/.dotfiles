#!/bin/bash

# Installation script for Linux/macOS
# Installs dotfiles to the corresponding directories

set -e

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Base directory of the script
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo -e "${BLUE}=== Starting dotfiles installation ===${NC}\n"

# 1. Install backgrounds
echo -e "${YELLOW}1. Installing backgrounds...${NC}"
BACKGROUNDS_SRC="$DOTFILES_DIR/.config/backgrounds"
BACKGROUNDS_DEST="$HOME/.local/share/pixmaps"

if [ -d "$BACKGROUNDS_SRC" ]; then
    mkdir -p "$BACKGROUNDS_DEST"
    cp -v "$BACKGROUNDS_SRC"/* "$BACKGROUNDS_DEST/"
    echo -e "${GREEN}✓ Backgrounds installed in $BACKGROUNDS_DEST${NC}\n"
else
    echo -e "${YELLOW}✗ Backgrounds folder not found${NC}\n"
fi

# 2. Install VS Code configuration
echo -e "${YELLOW}2. Installing VS Code configuration...${NC}"

# Detect Operating System
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    VSCODE_CONFIG_DIR="$HOME/Library/Application Support/Code/User"
else
    # Linux
    VSCODE_CONFIG_DIR="$HOME/.config/Code/User"
fi

mkdir -p "$VSCODE_CONFIG_DIR"

# Copy settings.json
if [ -f "$DOTFILES_DIR/.config/vscode/settings.json" ]; then
    cp -v "$DOTFILES_DIR/.config/vscode/settings.json" "$VSCODE_CONFIG_DIR/"
    echo -e "${GREEN}✓ settings.json installed${NC}\n"
else
    echo -e "${YELLOW}✗ settings.json not found${NC}\n"
fi

# 3. Install VS Code profiles
echo -e "${YELLOW}3. Installing VS Code profiles...${NC}"
VSCODE_PROFILES_SRC="$DOTFILES_DIR/.config/vscode/profiles"
VSCODE_PROFILES_DEST="$VSCODE_CONFIG_DIR/profiles"

if [ -d "$VSCODE_PROFILES_SRC" ]; then
    mkdir -p "$VSCODE_PROFILES_DEST"
    cp -v "$VSCODE_PROFILES_SRC"/* "$VSCODE_PROFILES_DEST/"
    echo -e "${GREEN}✓ Profiles installed in $VSCODE_PROFILES_DEST${NC}\n"
else
    echo -e "${YELLOW}✗ Profiles folder not found${NC}\n"
fi

echo -e "${GREEN}=== Installation completed ===${NC}"
echo -e "${BLUE}VS Code configuration directory: $VSCODE_CONFIG_DIR${NC}"
echo -e "${BLUE}Backgrounds directory: $BACKGROUNDS_DEST${NC}"
