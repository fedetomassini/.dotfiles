# Source and destination directories
DOTFILES_DIR="${pwd}dotfiles"
BASHRC_SRC="$DOTFILES_DIR/bash/.bashrc"
KITTY_SRC="$DOTFILES_DIR/kitty/kitty.conf"
ROFI_SRC="$DOTFILES_DIR/rofi/config.rasi"
VSCODE_SRC="$DOTFILES_DIR/vscode/settings.json"
NEOFETCH_SRC="$DOTFILES_DIR/bash/neofetch/config.conf"

BASHRC_DEST="$HOME/.bashrc"
KITTY_DEST="$HOME/.config/kitty"
ROFI_DEST="$HOME/.config/rofi/config"
VSCODE_DEST="$HOME/.config/Code/User"
NEOFETCH_DEST="$HOME/.config/neofetch"

# Function to copy files
copied_files=0

copy_file() {
  local src=$1
  local dest=$2

  if [ -f "$src" ]; then
    read -p "Do you want to copy $src to $dest? (y/n): " answer
    if [ "$answer" = "y" ]; then
      cp "$src" "$dest"
      echo -e  "\e[33mCopying $src to $dest\e[0m"
      ((copied_files++))
    else
      echo -e "\e[31mSkipped copying $src.\e[0m"
    fi
  else  
    echo -e "\e[31mError: $src not found.\e[0m"
  fi
}

# Copy files to their respective locations
copy_file "$BASHRC_SRC" "$BASHRC_DEST"
copy_file "$KITTY_SRC" "$KITTY_DEST"
copy_file "$ROFI_SRC" "$ROFI_DEST"
copy_file "$VSCODE_SRC" "$VSCODE_DEST"
copy_file "$NEOFETCH_SRC" "$NEOFETCH_DEST"

echo -e "\e[32mDone => Copied $copied_files/6 files.\e[0m"
