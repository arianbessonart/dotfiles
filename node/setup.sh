#!/bin/bash

set -e

# Install nvm if not already installed
if [ ! -d "$HOME/.nvm" ]; then
  echo "Installing nvm..."
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

  # Load nvm
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
else
  echo "nvm already installed. Skipping..."

  # Load nvm
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
fi

# Install latest LTS version of Node.js if not already installed
if ! command -v node >/dev/null 2>&1; then
  echo "Installing Node.js LTS..."
  nvm install --lts
  nvm use --lts
  nvm alias default 'lts/*'
else
  echo "Node.js already installed: $(node --version)"
fi

# Verify npm is available
if ! command -v npm >/dev/null 2>&1; then
  echo "Error: npm not found after Node.js installation"
  exit 1
fi

# Install global npm packages (optional - uncomment if needed)
# echo "Installing global npm packages..."
# npm install -g create-react-app prettier serve nodemon pm2 gatsby-cli

echo ""
echo "Node.js setup complete!"
echo "To use nvm in new terminals, restart your terminal or run: source ~/.zshrc"
