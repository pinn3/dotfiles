#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ln -s $DIR/gitignore_global ~/.gitignore_global &&
ln -s $DIR/gitconfig ~/.gitconfig &&
echo "Symlinked git dotfiles."

