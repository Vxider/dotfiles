## =====================FZF=======================
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# export FZF_CTRL_T_OPTS="--preview '(highlight --style Candy -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
# export FZF_DEFAULT_OPTS='--height=70% --preview="bat {}" --preview-window=right:60%:wrap'
# export FZF_HIGHLIGHT_PREVIEW_OPTS="--height 100% --preview '(highlight --style Candy -O ansi -l {} 2> /dev/null || bat {} || tree -C {}) 2> /dev/null' --preview-window=up:40%"

export FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%:wrap' --preview 'bat --color=always --style=header,grid --line-range :300 {}'"
export FZF_CTRL_T_OPTS="--preview '(bat --color=always --style=header,grid --line-range :300 {}) 2> /dev/null | head -200' --select-1 --exit-0"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview' --exact"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

export FZF_DEFAULT_COMMAND='fd --hidden --follow --exclude ".git" --type file'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--color=dark
--color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f
--color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7
'

# Use fd and fzf to get the args to a command.
# Works only with zsh
# Examples:
# f mv # To move files. You can write the destination after selecting the files.
# f 'echo Selected:'
# f 'echo Selected music:' --extention mp3
# fm rm # To rm files in current directory
f() {
    sels=( "${(@f)$(fd "${fd_default[@]}" "${@:2}"| fzf)}" )
    test -n "$sels" && print -z -- "$1 ${sels[@]:q:q}"
}

# Integration with autojump
# like normal autojump when used with arguments but displays an fzf prompt when used without
j() {
    if [[ "$#" -ne 0 ]]; then
        cd "$(autojump "$@")"
        return
    fi
    cd "$(autojump -s | sort -k1gr | awk '$1 ~ /[0-9]:/ && $2 ~ /^\// { for (i=2; i<=NF; i++) { print $(i) } }' |  fzf --height 40% --reverse --inline-info --no-preview)" 
}

# fe [FUZZY PATTERN] - Open the selected file with the default editor
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
#   - CTRL-O to open with `open` command,
#   - CTRL-E or Enter key to open with the $EDITOR
fo() {
  local out file key
  IFS=$'\n' out=("$(fzf-tmux --query="$1" --exit-0 --expect=ctrl-o,ctrl-e)")
  key=$(head -1 <<< "$out")
  file=$(head -2 <<< "$out" | tail -1)
  if [ -n "$file" ]; then
    [ "$key" = ctrl-o ] && open "$file" || ${EDITOR:-vim} "$file"
  fi
}

# fkill - kill processes - list only the ones you can kill. Modified the earlier script.
fkill() {
    local pid 
    if [ "$UID" != "0" ]; then
        pid=$(ps -f -u $UID | sed 1d | fzf -m --no-preview | awk '{print $2}')
    else
        pid=$(ps -ef | sed 1d | fzf -m --no-preview | awk '{print $2}')
    fi  

    if [ "x$pid" != "x" ]
    then
        echo $pid | xargs kill -${1:-9}
    fi  
}

# fast search pdf content
p () {
    local open
    open=open   # on OSX, "open" opens a pdf in preview
    ag -U -g ".pdf$" \
    | fast-p \
    | fzf --read0 --reverse -e -d $'\t'  \
        --preview-window down:80% --preview '
            v=$(echo {q} | gtr " " "|"); 
            echo -e {1}"\n"{2} | ggrep -E "^|$v" -i --color=always;
        ' \
    | gcut -z -f 1 -d $'\t' | gtr -d '\n' | gxargs -r --null $open > /dev/null 2> /dev/null
}

#inspired by fd, but uses mdfind on mac = faster 
#braces are essential
cf() {
  DIR=$(mdfind "kind:folder" -onlyin ~ -name  2> /dev/null | fzf --no-preview) && cd "${DIR}"
}

code() {
    if [ $# -eq 0 ]; then
        DIR=$(mdfind "kind:folder" -onlyin ~ -name  2> /dev/null | fzf --no-preview) && command code "$DIR"
    else
        command code "$1"
    fi
}
