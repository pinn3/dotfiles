#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
mv ~/.bashrc ~/.bash_profile &&
echo "Renamed bashrc to bash_profile" &&

ln -s $DIR/DefaultKeyBinding.dict ~/Library/KeyBindings/DefaultKeyBinding.dict &&
ln -s $DIR/hammerspoon ~/.hammerspoon &&
echo "Symlinked osx dotfiles." &&

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" &&
echo "Installed brew"
