#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e


# Installation
# 1. homebrew/install.sh
# 2. shell/setup.sh
# 3. git/setup.sh
# 4. node/setup.sh
# 5. rust/setup.sh
# 6. vim/setup.sh
# 7. tmux/setup.sh

uname=`uname`
platform="unknown"
if [ $uname == "Darwin" ]; then
  platform="macos"
fi

if [ $platform == "macos" ]; then
  echo "./homebrew/install.sh"
  # ./setup-mac
fi

homebrew/install.sh
shell/setup.sh
git/setup.sh
node/setup.sh
rust/setup.sh
vim/setup.sh
tmux/setup.sh

if [ $platform == "macos" ]; then
  echo "./setup-mac"
fi
