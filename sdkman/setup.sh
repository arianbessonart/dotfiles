#!/bin/bash

if [ -d "$HOME/.sdkman" ]; then
  echo "SDKMAN already installed, skipping..."
else
  curl -s "https://get.sdkman.io" | bash
fi

source "$HOME/.sdkman/bin/sdkman-init.sh"