#!/bin/sh
set -e

#git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime

echo 'set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

try
    source ~/.dotfiles/vim/keymap.vim
catch

endtry
try
    source ~/.dotfiles/vim/plugin.vim
catch
endtry

try
    source ~/.dotfiles/vim/vimrc.vim
catch
endtry
' > ~/.vimrc

echo "Installed the Vim configuration successfully!"
