# dotfiles

Personal configuration files for zsh, vim, tmux, and karabiner.

## Structure

```
dotfiles/
├── karabiner/       # macOS keyboard mappings
├── tmux/            # tmux config (based on gpakosz/.tmux)
├── vim/             # vim config (based on amix/vimrc)
└── zsh/             # zsh config (oh-my-zsh + powerlevel10k + zplug)
```

## Install

Each module has its own `install_conf.sh`. Run from the module directory:

```bash
# e.g. install zsh config
cd zsh && ./install_conf.sh
```

For zsh, you may also need to run `./install_oh-my-zsh.sh` first.

## Machine-specific Configs

`~/.zshrc.pre` and `~/.zshrc.post` are for machine-specific settings (tokens,
paths, proxy, etc.). They are **not** tracked by git.

On first install, templates are copied to `~/.zshrc.pre` and `~/.zshrc.post`
if they don't already exist. Edit them for your environment.

Example `~/.zshrc.pre`:
```sh
eval "$(/opt/homebrew/bin/brew shellenv)"
export ZPLUG_HOME=/opt/homebrew/opt/zplug
```

Example `~/.zshrc.post`:
```sh
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
```
