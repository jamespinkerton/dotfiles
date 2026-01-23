export MAMBA_ROOT_PREFIX=/mnt/disks/scratch/mamba
export PATH=/mnt/disks/scratch/mamba/bin:$PATH
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

export TMPDIR=/mnt/disks/scratch/$USER/tmp
export TMP=$TMPDIR
export TEMP=$TMPDIR
export DATA_DISK=/mnt/disks/scratch/$USER/app_cache
export XDG_CACHE_HOME="$DATA_DISK/cache"
export XDG_DATA_HOME="$DATA_DISK/local/share"
export NPM_CONFIG_CACHE="$DATA_DISK/npm"
export JUPYTER_DATA_DIR="$DATA_DISK/jupyter"
export IPYTHONDIR="$DATA_DISK/ipython"
export TF_DATA_DIR="$DATA_DISK/terraform.d"
export CLAUDE_CONFIG_DIR="$DATA_DISK/claude"
export CLAUDE_CODE_TMPDIR="$DATA_DISK/claude_tmp"
export CONDA_PKGS_DIRS="$DATA_DISK/conda/pkgs"


[ -f ~/.fzf.bash ] && source ~/.fzf.bash
eval "$(fzf --bash)"
[ -f /etc/bash_completion ] && ! shopt -oq posix && source /etc/bash_completion
[ -f ~/.iterm2_shell_integration.bash ] && source ~/.iterm2_shell_integration.bash
[ -f ~/.config/git/git_prompt.sh ] && source ~/.config/git/git_prompt.sh
[ -f ~/.bashrc.local ] && source ~/.bashrc.local

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
alias glsj='gcloud compute instances list --filter="name ~ james"'
alias gc='bin/python gcfarm/cli.py'

function vcsv {
    /usr/bin/perl -pe 's/((?<=,)|(?<=^)),/ ,/g;' "$@" | column -t -s, | less  -F -S -X -K -N
}

SMILEY='`if [ $? = 0 ]; then echo \[\e[32m\]:\)\[\e[37m\]; else echo \[\e[31m\]:\(\[\e[37m\]; fi`'
PS1="$SMILEY\[\e[36m\] @\h \w $ \[\e[37m\]"
# PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
PROMPT_COMMAND=

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/mnt/disks/scratch/mamba/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/mnt/disks/scratch/mamba/etc/profile.d/conda.sh" ]; then
        . "/mnt/disks/scratch/mamba/etc/profile.d/conda.sh"
    else
        export PATH="/mnt/disks/scratch/mamba/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/mnt/disks/scratch/mamba/etc/profile.d/mamba.sh" ]; then
    . "/mnt/disks/scratch/mamba/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<

