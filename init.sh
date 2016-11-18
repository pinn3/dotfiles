#!/bin/bash

read -r -p "Are you on OSX? [Y/n]" response
response=${response,,} # tolower

if [[ $response =~ ^(yes|y| ) ]]; then
  ./osx/setup.sh
fi

./screen/setup.sh
./git/setup.sh
./emacs/setup.sh
./prezto/setup.sh
