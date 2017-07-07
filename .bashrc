[ -z "$PS1" ] && return

# Source global definitions
[ -f /etc/bashrc ] && source /etc/bashrc
# Source Facebook definitions
[ -f /usr/facebook/ops/rc/master.bashrc ] && source /usr/facebook/ops/rc/master.bashrc
# Open the ports!
alias secure="http_proxy=http://fwdproxy:8080 https_proxy=http://fwdproxy:8080"

alias ls='ls --color=auto'
alias grep='grep -n --color=auto'
alias gg="git log --oneline --all --graph --decorate --color"
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias brc='vi ~/.bashrc;source ~/.bashrc'
alias n='nvim'
# alias texliveonfly="$(brew --cellar --prefix texlive)/20170111/texmf-dist/scripts/texliveonfly/texliveonfly.py"

git config --global credential.helper cache

SMILEY='`if [ $? = 0 ]; then echo \[\e[32m\]:\)\[\e[37m\]; else echo \[\e[31m\]:\(\[\e[37m\]; fi`'
PS1="$SMILEY\[\e[36m\] @\h \w $ \[\e[37m\]"
PROMPT_COMMAND=

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
