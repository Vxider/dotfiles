#!/bin/sh

cd
git clone https://github.com/gpakosz/.tmux.git
ln -sf ~/.dotfiles/tmux/tmux.conf ~/.tmux.conf

echo 'Installed the Tmux configuration successfully!'
