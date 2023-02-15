export PATH=/opt/homebrew/bin/:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.neovim/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export EDITOR=nvim
export HISTFILESIZE=10000
export HISTSIZE=200
export HISTCONTROL=ignoredups
export HISTIGNORE='&:ls:[bf]g:exit'
export TZ='America/New_York'
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export BASH_SILENCE_DEPRECATION_WARNING=1

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f /etc/bash_completion ] && ! shopt -oq posix && source /etc/bash_completion
[ -f ~/.iterm2_shell_integration.bash ] && source ~/.iterm2_shell_integration.bash
[ -f ~/.config/git/git_prompt.sh ] && source ~/.config/git/git_prompt.sh

shopt -s globstar
shopt -s extglob
shopt -s checkwinsize
shopt -s histappend
shopt -s cmdhist
shopt -s cdspell
shopt -s dirspell

set colored-stats on

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias vi='nvim'
alias vim='nvim'
alias hl='hg log --style $HOME/.hgrc.d/fancy.style'
alias hhl='hg log -G --style $HOME/.hgrc.d/fancy.style'
alias m='python/make.py'

function vcsv {
    /usr/bin/perl -pe 's/((?<=,)|(?<=^)),/ ,/g;' "$@" | column -t -s, | less  -F -S -X -K
}

SMILEY='`if [ $? = 0 ]; then echo \[\e[32m\]:\)\[\e[37m\]; else echo \[\e[31m\]:\(\[\e[37m\]; fi`'
PS1="$SMILEY\[\e[36m\] @\h \w $ \[\e[37m\]"
PROMPT_COMMAND=

[ -f ~/.local/bashrc ] && source ~/.local/bashrc
