#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

source utility


apps=(
  docker
  docker-machine
  git
  htop
  plantuml
  telnet
  tree
  "--HEAD universal-ctags/universal-ctags/universal-ctags"
  watch
  wget
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

appsCask=(
  "caffeine"
  "iterm2"
  "the-unarchiver"
  "the_silver_searcher"
  "visual-studio-code"
  "google-chrome"
  "itsycal"
  "postman"
  "postgresql"
  "lastpass"
  "skitch"
  "slack"
  "rectangle"
  "spotify"
  "vlc"
  "virtualbox"
  "whatsapp"
)

for appCask in "${appsCask[@]}"
do
  if ! brew cask info "$appCask" > /dev/null; then
    fancy_echo "$appCask installed"
  else
    echo "$appCask is not installed"
    brew cask install "$appCask"
  fi
done
