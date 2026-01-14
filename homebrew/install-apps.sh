#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

source utility


apps=(
  git
  htop
  jq
  plantuml
  telnet
  tree
  the_silver_searcher
  tmux
  tailscale
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
  "ghostty"
  "brave"
  "cursor"
  "chatgpt"
  "docker-desktop"
  "claude-code"
  "google-cloud-sdk"
  "itsycal"
  "meetingbar"
  "mongodb-compass"
  "notion"
  "notion-calendar"
  "postman"
  "stremio"
  "slack"
  "rectangle"
  "spotify"
  "vlc"
  "whatsapp"
)

for appCask in "${appsCask[@]}"
do
  if ! brew info --cask "$appCask" > /dev/null; then
    fancy_echo "$appCask installed"
  else
    echo "$appCask is not installed"
    brew install --cask "$appCask"
  fi
done
