#!/bin/bash

set -e

# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DOTFILES_DIR="$( cd "$SCRIPT_DIR/.." && pwd )"

if [ ! -f "$HOME/.local/share/nvim/site/autoload/plug.vim" ]; then
  echo "Installing vim-plug for Neovim..."
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
else
  echo "vim-plug already installed. Skipping..."
fi

# Create neovim folder
mkdir -p $HOME/.config/nvim/

# Symbolic Link
if [ ! -f "$HOME/.config/nvim/init.vim" ]; then
  ln -s $DOTFILES_DIR/vim/init.vim $HOME/.config/nvim/init.vim
  echo "Linked init.vim"
else
  echo "init.vim already exists. Skipping..."
fi

echo ""
echo "Neovim setup complete! Run 'nvim' and execute :PlugInstall to install plugins."
