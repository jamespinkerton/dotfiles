[ -z "$PS1" ] && return

[ -f $HOME/.bashrc.local ] && source $HOME/.bashrc.local
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f '/Users/pinkerton/Downloads/google-cloud-sdk/path.bash.inc' ] && source '/Users/pinkerton/Downloads/google-cloud-sdk/path.bash.inc'
[ -f '/Users/pinkerton/Downloads/google-cloud-sdk/completion.bash.inc' ] && source '/Users/pinkerton/Downloads/google-cloud-sdk/completion.bash.inc'
[ -f '/etc/bash_completion' ] && ! shopt -oq posix && source '/etc/bash_completion'

if [[ "$(uname -s)" != "Darwin" ]]; then
    alias ls='ls --color=auto'
else
    alias ls='gls --color=auto'
fi
alias grep='grep -n --color=auto'
alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias vi='nvim'
alias vim='nvim'

function pretty_csv {
    column -t -s, -n "$@" | less -F -S -X -K
}
# function pretty_csv {
#     perl -pe 's/((?<=,)|(?<=^)),/ ,/g;' "$@" | column -t -s, | less  -F -S -X -K
# }

shopt -s globstar
shopt -s checkwinsize

if [[ "$(uname -s)" != "Darwin" ]]; then
    SMILEY='`if [ $? = 0 ]; then echo \[\e[32m\]:\)\[\e[37m\]; else echo \[\e[31m\]:\(\[\e[37m\]; fi`'
    PS1="$SMILEY\[\e[36m\] @\h \w $ \[\e[37m\]"
    PROMPT_COMMAND=
fi

# TODO:
# bash autocomplete
# git autocomplete
# vim clang complete
# airline in vim
# powerline in terminal
# colored autocomplete bash
# eval $(dircolors -b $HOME/.dircolors)
