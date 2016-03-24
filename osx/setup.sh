#!/bin/bash

read -r -p "Are you on OSX? [Y/n]" response
response=${response,,} # tolower

if [[ $response =~ ^(yes|y| ) ]]; then
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
    ln -s $DIR/DefaultKeyBinding.dict ~/Library/KeyBindings/DefaultKeyBinding.dict
    echo "Symlinked osx dotfiles."
fi
