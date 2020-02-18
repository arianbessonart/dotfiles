#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Create neovim folder
mkdir -p $HOME/.config/nvim/

# Symbolic Link
ln -s $HOME/dotfiles/vim/init.vim $HOME/.config/nvim/init.vim
