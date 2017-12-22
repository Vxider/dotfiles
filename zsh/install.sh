#!/bin/sh

ln ~/.dotfile/zsh/zshrc ~/.zshrc
echo 'export DEFAULT_USER="Vxider"' > ~/.zshrc.local
echo 'Please set DEFAULT_USER in ~/.zshrc.local'
echo 'Installed zshrc configuration successfully!'
