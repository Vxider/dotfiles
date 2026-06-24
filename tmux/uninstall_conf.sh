#!/usr/bin/env bash
set -euo pipefail

echo "Uninstalling tmux configuration..."

# Remove symlinks
rm -f ~/.tmux.conf.local
rm -f ~/.tmux.conf

# Remove cloned repos (optional - comment out if you want to keep)
rm -rf ~/.tmux

echo "Uninstalled tmux configuration successfully!"
