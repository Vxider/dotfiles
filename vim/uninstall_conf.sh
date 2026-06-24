#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Uninstalling vim configuration..."

# Remove symlinks
rm -f ~/.config/vim/keymap.vim
rm -f ~/.config/vim/plugin.vim
rm -f ~/.config/vim/vimrc.vim
rm -f ~/.vimrc

# Remove cloned repos (optional - comment out if you want to keep)
rm -rf ~/.vim_runtime

echo "Uninstalled vim configuration successfully!"
