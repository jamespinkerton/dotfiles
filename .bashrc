[ -z "$PS1" ] && return
[ -f $HOME/.bashrc.local ] && source $HOME/.bashrc.local
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f /etc/bash_completion ] && ! shopt -oq posix && source /etc/bash_completion
[ -f $HOME/.git-completion.bash ] && source $HOME/.git-completion.bash

bind -x '"\C-r": $SHELL -c "$FZF_DEFAULT_COMMAND" && __fzf_history__'

shopt -s globstar
shopt -s extglob
shopt -s checkwinsize
shopt -s histappend
shopt -s cmdhist
shopt -s cdspell
shopt -s dirspell

if [[ "$(uname -s)" != "Darwin" ]]; then
    alias ls='ls --color=auto'
else
    alias ls='gls --color=auto'
fi
alias grep='grep --color=auto'
alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias vi='nvim'
alias hl="hg log --style ~/.hgrc.d/fancy.style"
alias hhl="hg log -G --style ~/.hgrc.d/fancy.style"

function vcsv {
    if [ "$(uname -s)" != "Darwin" ] && [ "$(grep -Ei 'debian|buntu|mint' /etc/*release)" ]; then
        column -t -s, -n "$@" | less -F -S -X -K
    else
        perl -pe 's/((?<=,)|(?<=^)),/ ,/g;' "$@" | column -t -s, | less  -F -S -X -K
    fi
}

function gvcsv {
    gsutil cat $1 | vcsv
}

function mail_html {
    mail -s "$(echo -e "Terminal Email\nContent-Type: text/html")"
}

if [[ "$(uname -s)" != "Darwin" ]]; then
    SMILEY='`if [ $? = 0 ]; then echo \[\e[32m\]:\)\[\e[37m\]; else echo \[\e[31m\]:\(\[\e[37m\]; fi`'
    PS1="$SMILEY\[\e[36m\] @\h \w $ \[\e[37m\]"
    PROMPT_COMMAND=
fi

# export ITERMPLOT=
export MPLBACKEND="module://itermplot"
export ITERMPLOT_LINES=70

# chmod g+rwx
# jupyter notebook --ip 0.0.0.0
# http://10.143.128.21:8888/

# tmux -S /tmp/nwani.shared new
# chmod 777 /tmp/nwani.shared
# gsutil perfdiag -o output.json -s 100M gs://latour-jpinkerton-central1
