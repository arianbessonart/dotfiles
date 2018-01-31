#!/bin/bash


## Custom color codes & utility functions
source utility.sh




# Git configuration

e_header "Setup git config (global)"
cp gitignore ~/.gitignore_global  ## Adding .gitignore global
git config --global core.excludesfile "${HOME}/.gitignore_global"

ask "${blue} (Option) Enter Your Git Email: "
read -r emailId
if is_empty $emailId; then
  git config --global user.email "$emailId" ## Git Email Id
  e_success "Email is set"
else
  e_error "Not set"
fi

ask "${blue} (Option) Enter Your Git Username: "
read -r userName
if is_empty $userName; then
  git config --global user.name "$userName" ## Git Username
  e_success "Username is set"
else
  e_error "Not set"
fi

## Git alias
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status

## Install oh-my-zsh

ZSH=~/.oh-my-zsh

if [ -d "$ZSH" ]; then
  e_warning "Oh My Zsh is already installed. Skipping.."
else
  e_header "Installing Oh My Zsh..."
  curl -L http://install.ohmyz.sh | sh

  ## To install ZSH themes & aliases
  e_header "Copying ZSH themes & aliases..."
  e_note "Check .aliases file for more details."
  rm ~/.aliases
  rm ~/.zshrc
  rm ~/z.sh
  ln -s dotfiles/oh-my-zsh/aliases ~/.aliases
  ln -s dotfiles/oh-my-zsh/zshrc ~/.zshrc
  ln -s dotfiles/oh-my-zsh/z.sh ~/z.sh

  ## Theme
  git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH/themes/spaceship-prompt"
  ln -s "$ZSH/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH/themes/spaceship.zsh-theme"

  ## Autosuggest
  git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH/plugins/zsh-autosuggestions
fi

echo "🍺🍺🍺🍺  Thats all, Done."
