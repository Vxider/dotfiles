#!/usr/bin/env bash
set -euo pipefail

echo "Uninstalling karabiner configuration..."

# Remove symlink
rm -f ~/.config/karabiner

echo "Uninstalled karabiner configuration successfully!"
