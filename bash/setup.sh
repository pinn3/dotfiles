#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ln -s $DIR/bashrc ~/.bashrc &&
echo "Symlinked bash dotfiles."
