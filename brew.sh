#!/usr/bin/env bash

# Install Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew upgrade

apps=(
    coreutils
    tree
    git
    vim
    wget
)

brew install "${apps[@]}"

brew tap caskroom/cask

appsCask=(
    google-chrome
    iterm2
    lastpass
    spotify
    sublime-text
    visual-studio-code
    the-unarchiver
)

brew cask install "${appsCask[@]}"
