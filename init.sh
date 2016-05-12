#!/bin/bash

read -r -p "Are you on OSX? [Y/n]" response
response=${response,,} # tolower

if [[ $response =~ ^(yes|y| ) ]]; then
    ./osx/setup.sh &&
    ./node/setup-osx.sh
fi

./git/setup.sh
./emacs/setup.sh
./prezto/setup.sh
