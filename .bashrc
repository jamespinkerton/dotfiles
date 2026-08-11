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
export CODEX_HOME="$DATA_DISK/codex"
export PI_CODING_AGENT_DIR="$DATA_DISK/pi"
export OPENCODE_CONFIG="$DATA_DISK/opencode/opencode.json"
export CONDA_PKGS_DIRS="$DATA_DISK/conda/pkgs"
export DOTNET_ROOT="$MAMBA_ROOT_PREFIX/lib/dotnet"
export PATH="$DOTNET_ROOT:$DOTNET_ROOT/tools:$PATH"


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
alias c1='CODEX_HOME="$DATA_DISK/codex" codex'
alias c2='CODEX_HOME="$DATA_DISK/codex2" codex'

function _claude_mixed {
    local main_model="$1"
    local custom_model="$2"
    local custom_model_name="$3"
    shift 3

    local cliproxy_key
    cliproxy_key="$(
        sed -n '/^api-keys:/,/^[^[:space:]]/ {
            s/^[[:space:]]*-[[:space:]]*"\(sk-[^"]*\)".*/\1/p
        }' "$DATA_DISK/cli-proxy-api/config.yaml" | head -n 1
    )"
    if [ -z "$cliproxy_key" ]; then
        echo "_claude_mixed: no proxy API key found in $DATA_DISK/cli-proxy-api/config.yaml" >&2
        return 1
    fi

    (
        unset CLAUDE_CODE_SUBAGENT_MODEL
        unset CLAUDE_CODE_ENABLE_GATEWAY_MODEL_DISCOVERY
        export ANTHROPIC_BASE_URL=http://127.0.0.1:8317
        export ANTHROPIC_AUTH_TOKEN="$cliproxy_key"
        if [ -n "$custom_model" ]; then
            export ANTHROPIC_CUSTOM_MODEL_OPTION="$custom_model"
            export ANTHROPIC_CUSTOM_MODEL_OPTION_NAME="$custom_model_name"
            export ANTHROPIC_CUSTOM_MODEL_OPTION_DESCRIPTION="Codex OAuth through CLIProxyAPI"
        else
            unset ANTHROPIC_CUSTOM_MODEL_OPTION
            unset ANTHROPIC_CUSTOM_MODEL_OPTION_NAME
            unset ANTHROPIC_CUSTOM_MODEL_OPTION_DESCRIPTION
        fi
        export CLAUDE_CODE_ALWAYS_ENABLE_EFFORT=1
        export CLAUDE_CODE_MAX_TOOL_USE_CONCURRENCY=3
        export CLAUDE_CODE_AUTO_COMPACT_WINDOW=372000
        export ENABLE_TOOL_SEARCH=false
        echo command claude --model "$main_model" "$@"
        command claude --model "$main_model" "$@"
    )
}

function claudex {
    _claude_mixed gpt-5.6-sol gpt-5.6-sol "GPT 5.6 Sol" "$@"
}

function claudex-fast {
    _claude_mixed gpt-5.6-sol-fast gpt-5.6-sol-fast "GPT 5.6 Sol Fast" "$@"
}

function claudef {
    _claude_mixed fable "" "" "$@"
}

codex-worktree() {
  if [ -z "$1" ]; then
    echo "Usage: codex-worktree <worktree-name> [base-ref]"
    return 2
  fi

  local name="$1"
  local base_ref="${2:-HEAD}"
  local repo_root
  local worktree_path
  local exclude_file

  repo_root="$(git rev-parse --show-toplevel)" || return
  worktree_path="$repo_root/.codex/worktrees/$name"
  exclude_file="$(git rev-parse --git-path info/exclude)"

  if [ -e "$worktree_path" ]; then
    echo "Worktree path already exists: $worktree_path"
    return 1
  fi

  mkdir -p "$repo_root/.codex/worktrees"

  grep -qxF '/.codex/worktrees/' "$exclude_file" 2>/dev/null ||
    echo '/.codex/worktrees/' >> "$exclude_file"

  git worktree add --detach "$worktree_path" "$base_ref" || return

  (
    cd "$worktree_path" &&
    codex
  )
}

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

# opencode
export PATH=/home/james/.opencode/bin:$PATH


# Added by Antigravity CLI installer
export PATH="/home/james/.local/bin:$PATH"
