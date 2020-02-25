#!/bin/sh

set -e

source utility

# Create gopath directory
if ! [ -d "$HOME/go" ]; then
    mkdir -p "$HOME/go/"{src,pkg,bin}
fi

fancy_echo "Installing golang tools"
go get golang.org/x/tools/cmd/...
