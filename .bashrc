[ -z "$PS1" ] && return

# Facebook:
[ -f /etc/bashrc ] && source /etc/bashrc
[ -f /usr/facebook/ops/rc/master.bashrc ] && source /usr/facebook/ops/rc/master.bashrc
alias secure="http_proxy=http://fwdproxy:8080 https_proxy=http://fwdproxy:8080"

alias ls='ls --color=auto'
alias grep='grep -n --color=auto'
alias gitout="git log --branches --not --remotes=origin"
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias brc='vi ~/.bashrc;source ~/.bashrc'
alias n='usr/local/bin/nvim'
alias nvim='usr/local/bin/nvim'

shopt -s globstar
shopt -s checkwinsize

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

SMILEY='`if [ $? = 0 ]; then echo \[\e[32m\]:\)\[\e[37m\]; else echo \[\e[31m\]:\(\[\e[37m\]; fi`'
PS1="$SMILEY\[\e[36m\] @\h \w $ \[\e[37m\]"
PROMPT_COMMAND=
