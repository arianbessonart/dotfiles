#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

source utility

# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DOTFILES_DIR="$( cd "$SCRIPT_DIR/.." && pwd )"

## Install oh-my-zsh
OH_MY_ZSH=$HOME/.oh-my-zsh

if [ -d "$OH_MY_ZSH" ]; then
  fancy_echo "Oh My Zsh is already installed. Skipping.."
else
  fancy_echo "Installing Oh My Zsh..."
  curl -L http://install.ohmyz.sh | sh
fi

## To install ZSH themes & aliases
fancy_echo "Copying ZSH themes & aliases..."
rm -f $HOME/.aliases
rm -f $HOME/.zshrc
rm -f $HOME/z.sh
ln -s $DOTFILES_DIR/oh-my-zsh/aliases $HOME/.aliases
ln -s $DOTFILES_DIR/oh-my-zsh/zshrc $HOME/.zshrc
ln -s $DOTFILES_DIR/oh-my-zsh/z.sh $HOME/z.sh

## Autosuggest
if [ ! -d "$OH_MY_ZSH/plugins/zsh-autosuggestions" ]; then
  fancy_echo "Installing zsh-autosuggestions..."
  git clone https://github.com/zsh-users/zsh-autosuggestions $OH_MY_ZSH/plugins/zsh-autosuggestions
else
  fancy_echo "zsh-autosuggestions already installed. Skipping..."
fi

## Theme
if [ ! -d "$OH_MY_ZSH/custom/themes/spaceship-prompt" ]; then
  fancy_echo "Installing spaceship theme..."
  git clone https://github.com/denysdovhan/spaceship-prompt.git "$OH_MY_ZSH/custom/themes/spaceship-prompt"
  ln -s "$OH_MY_ZSH/custom/themes/spaceship-prompt/spaceship.zsh-theme" "$OH_MY_ZSH/custom/themes/spaceship.zsh-theme"
else
  fancy_echo "Spaceship theme already installed. Skipping..."
fi

## create .z file for z plugin
test -f $HOME/.z || touch $HOME/.z
