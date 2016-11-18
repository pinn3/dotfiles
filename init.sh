#!/bin/bash


read -r -p "Are you on OSX? [y/N] " response
case $response in
  [yY][eE][sS]|[yY])
    ./osx/setup.sh
    ;;
esac

./screen/setup.sh
./git/setup.sh
./emacs/setup.sh
