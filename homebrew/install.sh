#!/bin/sh

set -e
source utility

# Detect architecture and set homebrew prefix
if [[ $(uname -m) == 'arm64' ]]; then
  homebrew_prefix="/opt/homebrew"
else
  homebrew_prefix="/usr/local"
fi

if ! command -v brew >/dev/null; then
  fancy_echo "Installing Homebrew ..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # Add Homebrew to PATH for Apple Silicon
  if [[ $(uname -m) == 'arm64' ]]; then
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
else
  fancy_echo "Homebrew is already installed."
fi

fancy_echo "Updating Homebrew formulae ..."
brew update

apps=(
  coreutils
  eza
  fzf
  neovim
  ripgrep
  git
  go
  node
  yarn
)

for app in "${apps[@]}"
do
  if brew ls --versions "$app" > /dev/null; then
    fancy_echo "$app installed"
  else
    echo "$app is not installed"
    brew install "$app"
  fi
done
