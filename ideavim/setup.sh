#!/bin/bash

set -e

# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Symbolic Link
if [ ! -f "$HOME/.ideavimrc" ]; then
  ln -s "$SCRIPT_DIR/ideavimrc" "$HOME/.ideavimrc"
  echo "Linked .ideavimrc"
else
  echo ".ideavimrc already exists. Skipping..."
fi

echo "IdeaVim setup complete!"
