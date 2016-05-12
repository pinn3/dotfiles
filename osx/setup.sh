#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ln -s $DIR/DefaultKeyBinding.dict ~/Library/KeyBindings/DefaultKeyBinding.dict
echo "Symlinked osx dotfiles."

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
echo "Installed brew"