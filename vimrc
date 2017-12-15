set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim


try
    source ~/.config/vim/keymap.vim
catch

endtry
try
    source ~/.config/vim/plugin.vim
catch
endtry

try
    source ~/.config/vim/vimrc.vim
catch
endtry
