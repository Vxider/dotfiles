#!/bin/sh

cd
git clone https://github.com/gpakosz/.tmux.git
ln -sf .tmux/.tmux.conf

echo 'Installed the Tmux configuration successfully!'
