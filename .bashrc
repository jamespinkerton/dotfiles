export MAMBA_ROOT_PREFIX=/mnt/disks/scratch/mamba
export PATH=/mnt/disks/scratch/mamba/bin:$PATH
export PATH=/opt/homebrew/bin/:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.opencode/bin:$PATH
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
export CLAUDE_CONFIG_DIR="$DATA_DISK/claude"
export CLAUDE_CODE_TMPDIR="$DATA_DISK/claude_tmp"
export CODEX_HOME="$DATA_DISK/codex"
export PI_CODING_AGENT_DIR="$DATA_DISK/pi"
export OPENCODE_CONFIG="$DATA_DISK/opencode/opencode.json"
export CONDA_PKGS_DIRS="$DATA_DISK/conda/pkgs"

[[ $- != *i* ]] && return

eval "$(fzf --bash)"
[ -f /etc/bash_completion ] && ! shopt -oq posix && source /etc/bash_completion
[ -f ~/.bashrc.local ] && source ~/.bashrc.local

shopt -s globstar
shopt -s extglob
shopt -s histappend
shopt -s cdspell
shopt -s dirspell

bind 'set colored-stats on'

alias ls='ls --color=auto'
alias vi='nvim'
alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias gs='gcloud storage'
alias py='PYTHONPATH=. python'
alias st='PYTHONPATH=. streamlit'
alias gls='gcloud compute instances list'
alias glsj='gcloud compute instances list --filter="name ~ james"'
alias gc='bin/python gcfarm/cli.py'
alias c1='CODEX_HOME="$DATA_DISK/codex" codex'
alias c2='CODEX_HOME="$DATA_DISK/codex2" codex'

function claudex {
    local cliproxy_key
    cliproxy_key="$(
        sed -n '/^api-keys:/,/^[^[:space:]]/ {
            s/^[[:space:]]*-[[:space:]]*"\(sk-[^"]*\)".*/\1/p
        }' "$DATA_DISK/cli-proxy-api/config.yaml" | head -n 1
    )"
    if [ -z "$cliproxy_key" ]; then
        echo "claudex: no proxy API key found in $DATA_DISK/cli-proxy-api/config.yaml" >&2
        return 1
    fi

    (
        unset CLAUDE_CODE_SUBAGENT_MODEL
        unset CLAUDE_CODE_ENABLE_GATEWAY_MODEL_DISCOVERY
        export ANTHROPIC_BASE_URL=http://127.0.0.1:8317
        export ANTHROPIC_AUTH_TOKEN="$cliproxy_key"
        unset ANTHROPIC_CUSTOM_MODEL_OPTION
        unset ANTHROPIC_CUSTOM_MODEL_OPTION_NAME
        unset ANTHROPIC_CUSTOM_MODEL_OPTION_DESCRIPTION
        export CLAUDE_CODE_ALWAYS_ENABLE_EFFORT=1
        export CLAUDE_CODE_MAX_TOOL_USE_CONCURRENCY=3
        export CLAUDE_CODE_AUTO_COMPACT_WINDOW=372000
        export ENABLE_TOOL_SEARCH=false
        echo command claude "$@"
        command claude "$@"
    )
}

function vcsv {
    /usr/bin/perl -pe 's/((?<=,)|(?<=^)),/ ,/g;' "$@" | column -t -s, | less  -F -S -X -K -N
}

SMILEY='`if [ $? = 0 ]; then echo \[\e[32m\]:\)\[\e[37m\]; else echo \[\e[31m\]:\(\[\e[37m\]; fi`'
PS1="$SMILEY\[\e[36m\] @\h \w $ \[\e[37m\]"
PROMPT_COMMAND=

if [ -f "$MAMBA_ROOT_PREFIX/etc/profile.d/mamba.sh" ]; then
    . "$MAMBA_ROOT_PREFIX/etc/profile.d/mamba.sh"
fi
mamba activate base
