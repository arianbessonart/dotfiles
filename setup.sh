#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

interactive=0

# read flags
while [[ "$1" =~ ^- && ! "$1" == "--" ]]; do case $1 in
  -V | --version )
    echo $version
    exit
    ;;
  -i | --interactive )
    interactive=1
    ;;
esac; shift; done
if [[ "$1" == '--' ]]; then shift; fi

uname=`uname`
platform="unknown"
if [ $uname == "Darwin" ]; then
  platform="macos"
elif [ $uname == "Linux" ]; then
  platform="linux"
fi

if [ $platform == "macos" ]; then
  echo "./homebrew/install.sh"
  # ./setup-mac
fi

./git/setup.sh
# ./setup-bash
# ./setup-node
# ./setup-go
# ./setup-ruby
# ./setup-vim

if [[ $platform == "macos" ]] && [[ $interactive == 1 ]]; then
  read -p "Install Apps? [y/N] " installApps
  if [[ $installApps =~ ^[Yy]$ ]]; then
    echo "./homebrew/install-apps.sh"
  fi
fi

# curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
