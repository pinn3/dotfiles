#!/usr/bin/env bash

# Fastlane
export PATH="$HOME/.fastlane/bin:$PATH"

alias fe="docker run --rm -it -v /home/pinn3/git/flowbox-frontend:/usr/src -w /usr/src node:12.9.0"
