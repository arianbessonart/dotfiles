#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

source utility

## Install oh-my-zsh
OH_MY_ZSH=$HOME/.oh-my-zsh

## Install oh-my-zsh
OH_MY_ZSH=$HOME/.oh-my-zsh

if [ -d "$OH_MY_ZSH" ]; then
  fancy_echo "Oh My Zsh is already installed. Skipping.."
else
  fancy_echo "Installing Oh My Zsh..."
  curl -L http://install.ohmyz.sh | sh

  ## To install ZSH themes & aliases
  fancy_echo "Copying ZSH themes & aliases..."
  rm -f $HOME/.aliases
  rm -f $HOME/.zshrc
  rm -f $HOME/z.sh
  ln -s $HOME/dotfiles/oh-my-zsh/aliases $HOME/.aliases
  ln -s $HOME/dotfiles/oh-my-zsh/zshrc $HOME/.zshrc
  ln -s $HOME/dotfiles/oh-my-zsh/z.sh $HOME/z.sh

  ## Autosuggest
  git clone https://github.com/zsh-users/zsh-autosuggestions $OH_MY_ZSH/plugins/zsh-autosuggestions
  ## Autosuggest

  ## Theme
  git clone https://github.com/denysdovhan/spaceship-prompt.git "$OH_MY_ZSH/custom/themes/spaceship-prompt"
  ln -s "$OH_MY_ZSH/custom/themes/spaceship-prompt/spaceship.zsh-theme" "$OH_MY_ZSH/custom/themes/spaceship.zsh-theme"
  ## Theme

fi
## create .z file for z plugin
test -f $HOME/.z || touch $HOME/.z
