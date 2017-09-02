[ -z "$PS1" ] && return

# Facebook:
[ -f /etc/bashrc ] && source /etc/bashrc
[ -f /usr/facebook/ops/rc/master.bashrc ] && source /usr/facebook/ops/rc/master.bashrc
alias secure="http_proxy=http://fwdproxy:8080 https_proxy=http://fwdproxy:8080"

alias ls='ls --color=auto'
alias grep='grep -n --color=auto'
alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias brc='vi -o ~/.bashrc ~/.bash_profile;source ~/.bash_profile'
alias n='nvim'

shopt -s globstar
shopt -s checkwinsize

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

SMILEY='`if [ $? = 0 ]; then echo \[\e[32m\]:\)\[\e[37m\]; else echo \[\e[31m\]:\(\[\e[37m\]; fi`'
PS1="$SMILEY\[\e[36m\] @\h \w $ \[\e[37m\]"
PROMPT_COMMAND=

