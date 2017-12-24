#!/bin/sh

cp -r ~/.dotfiles/zsh/powerlevel9k ~/.oh-my-zsh/custom/themes/
ln -sf ~/.dotfiles/zsh/zshrc ~/.zshrc
echo 'export DEFAULT_USER="Vxider"' > ~/.zshrc.local
echo 'Please set DEFAULT_USER in ~/.zshrc.local'
echo 'Installed zshrc configuration successfully!'
