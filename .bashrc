[ -z "$PS1" ] && return

[ -f $HOME/.bashrc.local ] && source $HOME/.bashrc.local
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f "$HOME/Downloads/google-cloud-sdk/path.bash.inc" ] && source "$HOME/Downloads/google-cloud-sdk/path.bash.inc"
[ -f "$HOME/Downloads/google-cloud-sdk/completion.bash.inc" ] && source "$HOME/Downloads/google-cloud-sdk/completion.bash.inc"
[ -f '/etc/bash_completion' ] && ! shopt -oq posix && source '/etc/bash_completion'
[ -f "$HOME/.git-completion.bash" ] && source "$HOME/.git-completion.bash"

shopt -s globstar
shopt -s extglob
shopt -s checkwinsize
shopt -s histappend
shopt -s cmdhist
shopt -s cdspell
shopt -s dirspell
export HISTCONTROL=ignoredups
export HISTIGNORE="&:ls:[bf]g:exit"

if [[ "$(uname -s)" != "Darwin" ]]; then
    alias ls='ls --color=auto'
else
    alias ls='gls --color=auto'
fi
alias grep='grep -n --color=auto'
alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

function vcsv {
    if [ "$(uname -s)" != "Darwin" ] && [ "$(grep -Ei 'debian|buntu|mint' /etc/*release)" ]; then
        column -t -s, -n "$@" | less -F -S -X -K
    else
        perl -pe 's/((?<=,)|(?<=^)),/ ,/g;' "$@" | column -t -s, | less  -F -S -X -K
    fi
}

if [[ "$(uname -s)" != "Darwin" ]]; then
    alias vi='nvim'
    SMILEY='`if [ $? = 0 ]; then echo \[\e[32m\]:\)\[\e[37m\]; else echo \[\e[31m\]:\(\[\e[37m\]; fi`'
    PS1="$SMILEY\[\e[36m\] @\h \w $ \[\e[37m\]"
    PROMPT_COMMAND=
fi

DEVFAIR="devfair0168"
alias ssh_tunnel_h2="ssh -f $USER@$DEVFAIR -L 25565:$DEVFAIR:25565 -N"
alias login_h2="mosh prn-fairjmp01 -- ssh $DEVFAIR 'tmux new -A -s main'"
alias mount_h2="sshfs $USER@$DEVFAIR:/private/home/$USER h2_home -oauto_cache,reconnect,defer_permissions,noappledouble,negative_vncache,volname=H2_MOUNT"
