#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ln -s $DIR/bashrc ~/.bashrc &&
ln -s $DIR/modules ~/.bash_modules &&
echo "Symlinked bash dotfiles."
