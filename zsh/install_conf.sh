#!/bin/sh

# install zsh
#sudo yum -y install zsh

# install oh-my-zsh
#sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# install zsh-peco-history
git clone https://github.com/jimeh/zsh-peco-history.git ${ZSH_CUSTOM:~/.oh-my-zsh/custom}/plugins/zsh-peco-history

mkdir -p ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes
cp -r ~/.dotfiles/zsh/powerlevel9k ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/
ln -sf ~/.dotfiles/zsh/zshrc ~/.zshrc

echo 'export DEFAULT_USER=""' >> ~/.zshrc.local
echo 'Please set DEFAULT_USER in ~/.zshrc.local'
echo 'Installed zshrc configuration successfully!'
