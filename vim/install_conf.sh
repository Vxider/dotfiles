#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Clone amix/vimrc if not already present
if [ ! -d ~/.vim_runtime/.git ]; then
    git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
fi

# Clone vim-code-dark if not already present
if [ ! -d ~/.vim_runtime/my_plugins/vim-code-dark/.git ]; then
    git clone https://github.com/tomasiser/vim-code-dark.git ~/.vim_runtime/my_plugins/vim-code-dark
fi

mkdir -p ~/.config/vim
ln -sf "${SCRIPT_DIR}/keymap.vim" ~/.config/vim/
ln -sf "${SCRIPT_DIR}/plugin.vim" ~/.config/vim/
ln -sf "${SCRIPT_DIR}/vimrc.vim" ~/.config/vim/

cat > ~/.vimrc << VIMRC
set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

try
    source ~/.config/vim/keymap.vim
catch
endtry
try
    source ~/.config/vim/plugin.vim
catch
endtry

try
    source ~/.config/vim/vimrc.vim
catch
endtry
VIMRC

echo "Installed the Vim configuration successfully!"
