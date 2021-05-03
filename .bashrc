[ -z "$PS1" ] && return
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f ~/.forgit/forgit.plugin.sh ] && source ~/.forgit/forgit.plugin.sh
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
# export FORGIT_LOG_FORMAT="'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"
export FORGIT_LOG_FORMAT=
unalias gi
[ -f $HOME/.bashrc.local ] && source $HOME/.bashrc.local
[ -f /etc/bash_completion ] && ! shopt -oq posix && source /etc/bash_completion
[ -f $HOME/.git-completion.bash ] && source $HOME/.git-completion.bash

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


insert() {
  /usr/bin/perl -le 'require "sys/ioctl.ph"; ioctl(STDIN, &TIOCSTI, $_) for split "", join " ", @ARGV' -- "$@"
}
bind $'"\u200b":"foo "'

fh() {
  OPTS="--height ${FZF_TMUX_HEIGHT:-40%} -n2..,.. --tiebreak=index --bind=ctrl-r:toggle-sort,ctrl-z:ignore +m +s --tac"
  insert $(history | fzf $OPTS | sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g')
}

bind -x '"\C-r": fh'

function vcsv {
    if [ "$(uname -s)" != "Darwin" ] && [ "$(grep -Ei 'debian|buntu|mint' /etc/*release)" ]; then
        column -t -s, -n "$@" | less -F -S -X -K
    else
        /usr/bin/perl -pe 's/((?<=,)|(?<=^)),/ ,/g;' "$@" | column -t -s, | less  -F -S -X -K
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
