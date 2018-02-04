#!/usr/bin/env bash

# Install Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew upgrade

apps=(
    coreutils
    git
    htop
    tree
    vim
    wget
)

brew install "${apps[@]}"

brew tap caskroom/cask

appsCask=(
    caffeine
    google-chrome
    iterm2
    lastpass
    spotify
    sublime-text
    the-unarchiver
    visual-studio-code
)

brew cask install "${appsCask[@]}"
