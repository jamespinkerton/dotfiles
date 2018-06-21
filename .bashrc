[ -z "$PS1" ] && return

[ -f $HOME/.bashrc.local ] && source $HOME/.bashrc.local
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f '/Users/pinkerton/Downloads/google-cloud-sdk/path.bash.inc' ] && source '/Users/pinkerton/Downloads/google-cloud-sdk/path.bash.inc'
[ -f '/Users/pinkerton/Downloads/google-cloud-sdk/completion.bash.inc' ] && source '/Users/pinkerton/Downloads/google-cloud-sdk/completion.bash.inc'
[ -f '/etc/bash_completion' ] && ! shopt -oq posix && source '/etc/bash_completion'

shopt -s globstar
shopt -s checkwinsize

if [[ "$(uname -s)" != "Darwin" ]]; then
    alias ls='ls --color=auto'
else
    alias ls='gls --color=auto'
fi
alias grep='grep -n --color=auto'
alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

function pretty_csv {
    column -t -s, -n "$@" | less -F -S -X -K
}
function pretty_csv_perl {
    perl -pe 's/((?<=,)|(?<=^)),/ ,/g;' "$@" | column -t -s, | less  -F -S -X -K
}

if [[ "$(uname -s)" != "Darwin" ]]; then
    alias vi='nvim'
    SMILEY='`if [ $? = 0 ]; then echo \[\e[32m\]:\)\[\e[37m\]; else echo \[\e[31m\]:\(\[\e[37m\]; fi`'
    PS1="$SMILEY\[\e[36m\] @\h \w $ \[\e[37m\]"
    PROMPT_COMMAND=
fi

DEVFAIR="devfair0168"
alias SSH_PORT="ssh -f jamespinkerton@$DEVFAIR -L 25565:$DEVFAIR:25565 -N"
alias login_h2="mosh prn-fairjmp01 -- ssh -t $DEVFAIR 'tmux new -A -s main'"
alias mount_h2="sshfs jamespinkerton@$DEVFAIR:/private/home/jamespinkerton h2_home -oauto_cache,reconnect,defer_permissions,noappledouble,negative_vncache,volname=remoteDIR"

# TODO:
# bash autocomplete
# git autocomplete
# vim clang complete
# eval $(dircolors -b $HOME/.dircolors)
