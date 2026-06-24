#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

# Clone zsh-autosuggestions if not already present
if [ ! -d "${ZSH_CUSTOM}/plugins/zsh-autosuggestions/.git" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM}/plugins/zsh-autosuggestions"
fi

# Clone powerlevel10k if not already present
mkdir -p "${ZSH_CUSTOM}/themes"
if [ ! -d "${ZSH_CUSTOM}/themes/powerlevel10k/.git" ]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM}/themes/powerlevel10k"
fi

brew install fzf autojump fd zplug

mkdir -p ~/.config/zsh
mkdir -p ~/.log/

# Symlink main zshrc
ln -sf "${SCRIPT_DIR}/zshrc" ~/.zshrc

# Symlink all configs
for conf in "${SCRIPT_DIR}"/configs/*.zsh; do
    ln -sf "${conf}" ~/.config/zsh/
done
ln -sf "${SCRIPT_DIR}/functions.zsh" ~/.config/zsh/

# Install pre/post templates if not already present
if [ ! -f ~/.zshrc.pre ]; then
    cp "${SCRIPT_DIR}/zshrc.pre.template" ~/.zshrc.pre
    echo "Created ~/.zshrc.pre from template"
else
    echo "~/.zshrc.pre already exists, skipping"
fi

if [ ! -f ~/.zshrc.post ]; then
    cp "${SCRIPT_DIR}/zshrc.post.template" ~/.zshrc.post
    echo "Created ~/.zshrc.post from template"
else
    echo "~/.zshrc.post already exists, skipping"
fi

echo 'Installed zsh configuration successfully!'
