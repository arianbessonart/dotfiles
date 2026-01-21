#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Get the directory where this script is located and cd into it
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$SCRIPT_DIR"

# Installation
# 1. homebrew/install.sh
# 2. shell/setup.sh
# 3. git/setup.sh
# 4. node/setup.sh
# 5. rust/setup.sh
# 6. nvim/setup.sh
# 7. tmux/setup.sh
# 8. sdkman/setup.sh

uname=`uname`
platform="unknown"
if [ $uname == "Darwin" ]; then
  platform="macos"
fi

if [ $platform == "macos" ]; then
  echo "Installing Homebrew and apps..."
  homebrew/install.sh
fi

echo "Setting up Git..."
git/setup.sh

echo "Setting up Shell (Oh My Zsh)..."
shell/setup.sh

echo "Setting up Node..."
node/setup.sh

echo "Setting up Rust..."
rust/setup.sh

echo "Setting up Neovim (LazyVim)..."
nvim/setup.sh

echo "Setting up tmux..."
tmux/setup.sh

echo "Setting up SDKMAN..."
sdkman/setup.sh

echo "Setting up IdeaVim..."
ideavim/setup.sh

if [ $platform == "macos" ]; then
  echo "Mac-specific setup complete. You may want to run mac/setup.sh for additional macOS preferences."
fi

echo ""
echo "Setup complete! Please restart your terminal or run 'source ~/.zshrc' to apply changes."
