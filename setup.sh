#!/bin/bash

## Custom color codes & utility functions
source utility.sh

WORKING_DIR=$HOME

# Git configuration

e_header "Setup git config (global)"

rm -f $WORKING_DIR/.gitignore_global
ln -s dotfiles/.gitignore_global $WORKING_DIR/.gitignore

rm -f $WORKING_DIR/.gitconfig
ln -s dotfiles/.gitconfig $WORKING_DIR/.gitconfig

## Install oh-my-zsh

ZSH=$WORKING_DIR/.oh-my-zsh

if [ -d "$ZSH" ]; then
  e_warning "Oh My Zsh is already installed. Skipping.."
else
  e_header "Installing Oh My Zsh..."
  curl -L http://install.ohmyz.sh | sh

  ## To install ZSH themes & aliases
  e_header "Copying ZSH themes & aliases..."
  e_note "Check .aliases file for more details."
  rm -f $WORKING_DIR/.aliases
  rm -f $WORKING_DIR/.zshrc
  rm -f $WORKING_DIR/z.sh
  ln -s dotfiles/oh-my-zsh/aliases $WORKING_DIR/.aliases
  ln -s dotfiles/oh-my-zsh/zshrc $WORKING_DIR/.zshrc
  ln -s dotfiles/oh-my-zsh/z.sh $WORKING_DIR/z.sh

  ## Theme
  git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH/themes/spaceship-prompt"
  ln -s "$ZSH/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH/themes/spaceship.zsh-theme"

  ## Autosuggest
  git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH/plugins/zsh-autosuggestions
fi

test -f $WORKING_DIR/.z || touch $WORKING_DIR/.z

source brew.sh

echo "🍺🍺🍺🍺  Thats all, Done."
