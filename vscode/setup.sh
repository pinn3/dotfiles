#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

mkdir -p ~/.config/Code/User && \
ln -s $DIR/keybindings.json ~/.config/Code/User/keybindings.json && \
ln -s $DIR/settings.json ~/.config/Code/User/settings.json && \
mkdir -p ~/.vscode && \
ln -s $DIR/argv.json ~/.vscode/argv.json && \
echo "Symlinked VSCode configuration"

read -r -p "Install extensions? [y/N] " response
case $response in
  [yY][eE][sS]|[yY])
    mkdir -p ~/.vscode/extensions
    code --install-extension dbaeumer.vscode-eslint
    code --install-extension denoland.vscode-deno
    code --install-extension eamodio.gitlens
    code --install-extension esbenp.prettier-vscode
    code --install-extension kesmarag.base16-tomorrow-night
    code --install-extension sashaweiss.block-travel
    ;;
esac

