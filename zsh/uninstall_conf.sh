#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

echo "Uninstalling zsh configuration..."

# Remove symlinks
rm -f ~/.zshrc
rm -f ~/.config/zsh/zshrc
rm -f ~/.config/zsh/functions.zsh
for conf in "${SCRIPT_DIR}"/configs/*.zsh; do
    rm -f ~/.config/zsh/$(basename "${conf}")
done

# Remove cloned plugins/themes (optional - comment out if you want to keep)
rm -rf "${ZSH_CUSTOM}/plugins/zsh-autosuggestions"
rm -rf "${ZSH_CUSTOM}/themes/powerlevel10k"

# Keep ~/.zshrc.pre and ~/.zshrc.post (they may have your custom settings)
echo "~/.zshrc.pre and ~/.zshrc.post are kept - remove manually if needed"

echo "Uninstalled zsh configuration successfully!"
