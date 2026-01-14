#!/bin/bash

set -e

# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DOTFILES_DIR="$( cd "$SCRIPT_DIR/.." && pwd )"

mkdir -p ~/.tmux/plugins

if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  echo "Installing tmux plugin manager (tpm)..."
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
  echo "tpm already installed. Skipping..."
fi

if [ ! -f "$HOME/.tmux.conf" ]; then
  ln -s $DOTFILES_DIR/tmux/tmux.conf $HOME/.tmux.conf
  echo "Linked tmux.conf"
else
  echo "~/.tmux.conf already exists. Skipping..."
fi

echo ""
echo "tmux setup complete! After starting tmux, press prefix + I to install plugins."
