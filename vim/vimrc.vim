"Configuration file for vim
set modelines=0     " CVE-2007-2438

""Normally we use vim-extensions. If you want true vi-compatibility
"remove change the following statements
set nocompatible    " Use Vim defaults instead of 100% vi compatibility
set backspace=2     " more powerful backspacing

"" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
 au BufWrite /private/etc/pw.* set nowritebackup nobackup

" 设置语法高亮
syntax enable
syntax on

"设置行号
set nu!
set ai!

"设置缩进
set autoindent
set smartindent
set cindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
if &term=="xterm"
set t_Co=8
set t_Sb=^[[4%dm
set t_Sf=^[[3%dm
endif

"设置当文件被外部改变的时侯自动读入文件
if exists("&autoread")
set autoread
endif

set rtp+=~/.vim/bundle/Vundle.vim

"设置VIM细光标
"let &t_SI = "\<Esc>]1337;CursorShape=1\x7"
let &t_EI = "\<Esc>]1337;CursorShape=0\x7"
if exists('$TMUX')
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

source ~/.config/vim/keymap.vim
source ~/.config/vim/plugin.vim

"主题
Plugin 'dracula/vim'
:PluginInstall
