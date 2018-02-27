#!/bin/sh

cd
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
ln -sf ~/.dotfiles/tmux/tmux.conf.local ~/.tmux.conf.local

echo 'Installed the Tmux configuration successfully!'
