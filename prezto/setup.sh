#!/bin/bash

cd "$HOME" &&
git clone --recursive https://github.com/pinn3/prezto "$HOME/.zprezto" &&

#!/bin/zsh

source "$HOME/.zprezto/runcoms/zshrc"
cd "${ZDOTDIR:-$HOME}"/.zprezto &&
setopt EXTENDED_GLOB &&
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

chsh -s /bin/zsh
