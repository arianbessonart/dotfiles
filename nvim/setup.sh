#!/bin/bash

set -e

# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Backup existing nvim config if it exists and isn't our symlink
if [ -e "$HOME/.config/nvim" ] && [ ! -L "$HOME/.config/nvim" ]; then
  echo "Backing up existing nvim config to ~/.config/nvim.bak..."
  mv "$HOME/.config/nvim" "$HOME/.config/nvim.bak"
elif [ -L "$HOME/.config/nvim" ]; then
  echo "Removing existing nvim symlink..."
  rm "$HOME/.config/nvim"
fi

# Create .config directory if it doesn't exist
mkdir -p "$HOME/.config"

# Symlink the entire nvim directory
ln -s "$SCRIPT_DIR" "$HOME/.config/nvim"
echo "Linked nvim config"

echo ""
echo "Neovim (LazyVim) setup complete! Run 'nvim' to start - plugins will install automatically."
