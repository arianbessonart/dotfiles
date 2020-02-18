#!/bin/sh

set -e

source utility

homebrew_prefix="/usr/local"

if [ -d "$homebrew_prefix" ]; then
  if ! [ -r "$homebrew_prefix" ]; then
    sudo chown -R "$LOGNAME:admin" /usr/local
  fi
else
  sudo mkdir "$homebrew_prefix"
  sudo chflags norestricted "$homebrew_prefix"
  sudo chown -R "$LOGNAME:admin" "$homebrew_prefix"
fi

if ! command -v brew >/dev/null; then
  fancy_echo "Installing Homebrew ..."
  curl -fsS \
    'https://raw.githubusercontent.com/Homebrew/install/master/install' | ruby
fi

fancy_echo "Updating Homebrew formulae ..."
brew update
