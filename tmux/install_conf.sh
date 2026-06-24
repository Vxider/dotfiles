#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

ln -sf "${SCRIPT_DIR}/tmux.conf.local" ~/.tmux.conf.local

# Clone gpakosz/.tmux if not already present
if [ ! -d ~/.tmux/.git ]; then
    git clone https://github.com/gpakosz/.tmux.git ~/.tmux
fi

# Clone tpm if not already present
if [ ! -d ~/.tmux/plugins/tpm/.git ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

ln -sf .tmux/.tmux.conf ~/.tmux.conf

echo 'Installed the Tmux configuration successfully!'
