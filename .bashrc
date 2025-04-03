export PATH=/mnt/disks/condaman/mamba/bin:$PATH
export PATH=/opt/homebrew/bin/:$PATH
export PATH=$HOME/.cargo/bin:$PATH
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
eval "$(fzf --bash)"
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
alias vi='nvim'
alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias gs='gcloud storage'
alias py='PYTHONPATH=. python'
alias st='PYTHONPATH=. streamlit'
alias gls='gcloud compute instances list'

function vcsv {
    /usr/bin/perl -pe 's/((?<=,)|(?<=^)),/ ,/g;' "$@" | column -t -s, | less  -F -S -X -K -N
}

SMILEY='`if [ $? = 0 ]; then echo \[\e[32m\]:\)\[\e[37m\]; else echo \[\e[31m\]:\(\[\e[37m\]; fi`'
PS1="$SMILEY\[\e[36m\] @\h \w $ \[\e[37m\]"
# PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
PROMPT_COMMAND=

# >>> conda initialize >>>
# # !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/mnt/disks/condaman/mamba/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/mnt/disks/condaman/mamba/etc/profile.d/conda.sh" ]; then
#         . "/mnt/disks/condaman/mamba/etc/profile.d/conda.sh"
#     else
#         export PATH="/mnt/disks/condaman/mamba/bin:$PATH"
#     fi
# fi
# unset __conda_setup

if [ -f "/mnt/disks/condaman/mamba/etc/profile.d/mamba.sh" ]; then
    . "/mnt/disks/condaman/mamba/etc/profile.d/mamba.sh"
else
    echo "ERROR: Could not find /mnt/disks/condaman/mamba/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<


# ssh james@3.112.250.171 -i ~/.ssh/for_jrr_id_rsa
