# zshrc configuration

Based on [Oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) and [powerlevel9k](https://github.com/bhilburn/powerlevel9k)

## 1.INSTALL

1. execute `./install.sh`

2. add `DEFAULT_USER` to `~/.zshrc.local`

3. install plugins

**autojump**
```sh
yum install autojump
```

**history-substring-search**
```sh
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
```