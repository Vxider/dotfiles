#!/bin/sh

# install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
# install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

cp -r ~/.dotfiles/zsh/powerlevel9k ~/.oh-my-zsh/custom/themes/powerlevel9k
ln -sf ~/.dotfiles/zsh/zshrc ~/.zshrc
echo 'export DEFAULT_USER="Vxider"' >> ~/.zshrc.local
echo 'Please set DEFAULT_USER in ~/.zshrc.local'
echo 'Installed zshrc configuration successfully!'
