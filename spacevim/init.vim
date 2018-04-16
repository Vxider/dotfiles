"=============================================================================
" dark_powered.vim --- Dark powered mode of SpaceVim
" Copyright (c) 2016-2017 Wang Shidong & Contributors
" Author: Wang Shidong < wsdjeg at 163.com >
" URL: https://spacevim.org
" License: GPLv3
"=============================================================================


" SpaceVim Options: {{{
let g:spacevim_enable_debug = 1
let g:spacevim_realtime_leader_guide = 1
let g:spacevim_enable_tabline_filetype_icon = 1
let g:spacevim_enable_statusline_display_mode = 0
let g:spacevim_enable_os_fileformat_icon = 1
let g:spacevim_buffer_index_type = 1
let g:spacevim_enable_vimfiler_welcome = 1
let g:spacevim_enable_debug = 1
let g:spacevim_default_indent = 4
let g:spacevim_max_column     = 120
let g:spacevim_colorscheme = 'gruvbox'
let g:spacevim_colorscheme_bg = 'dark'
"let g:spacevim_windows_leader = ''
let g:spacevim_relativenumber = 0
" }}}

" SpaceVim Layers: {{{
call SpaceVim#layers#load('lang#c')
call SpaceVim#layers#load('lang#markdown')
call SpaceVim#layers#load('colorscheme')
call SpaceVim#layers#load('autocomplete')
call SpaceVim#layers#load('unite')
call SpaceVim#layers#load('tools')
call SpaceVim#layers#load('github')
" }}}


set ignorecase
set wrap
set scrolloff=10
let mapleader = ","
set norelativenumber

"设置VIM细光标
""let &t_SI = "\<Esc>]1337;CursorShape=1\x7"
let &t_EI = "\<Esc>]1337;CursorShape=0\x7"
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

try
    source ~/.SpaceVim.d/keymap.vim
catch
endtry
