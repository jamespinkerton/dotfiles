[ -z "$PS1" ] && return

[ -f $HOME/.bashrc.local ] && source $HOME/.bashrc.local
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f '/Users/pinkerton/Downloads/google-cloud-sdk/path.bash.inc' ] && source '/Users/pinkerton/Downloads/google-cloud-sdk/path.bash.inc'
[ -f '/Users/pinkerton/Downloads/google-cloud-sdk/completion.bash.inc' ] && source '/Users/pinkerton/Downloads/google-cloud-sdk/completion.bash.inc'

if [[ "$(uname -s)" != "Darwin" ]]; then
    alias ls='ls --color=auto'
else
    alias ls='gls --color=auto'
fi
alias grep='grep -n --color=auto'
alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias brc='nvim -o ~/.bashrc ~/.bash_profile;source ~/.bash_profile'
alias n='nvim'
alias add_keys="eval \"$(ssh-agent -s)\" && ssh-add -k ~/.ssh/id_rsa"
alias cherry="mosh cherry -- $TMX"

shopt -s globstar
shopt -s checkwinsize

if [[ "$(uname -s)" != "Darwin" ]]; then
    alias vi='nvim'
    SMILEY='`if [ $? = 0 ]; then echo \[\e[32m\]:\)\[\e[37m\]; else echo \[\e[31m\]:\(\[\e[37m\]; fi`'
    PS1="$SMILEY\[\e[36m\] @\h \w $ \[\e[37m\]"
    PROMPT_COMMAND=
fi
