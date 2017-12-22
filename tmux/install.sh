#!/bin/sh

cd
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
ln -s -f ~/.dotfile/tmux/tmux.conf.local ~/.tmux.conf.local

echo 'Installed the Tmux configuration successfully!'
