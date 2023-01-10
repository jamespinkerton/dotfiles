export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.neovim/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
# export PATH=/mnt/disks/condaman/research_env/bin:$PATH
export PATH=/mnt/disks/condaman/mambaforge/bin:$PATH
export EDITOR=nvim
export HISTFILESIZE=10000
export HISTSIZE=200
export HISTCONTROL=ignoredups
export HISTIGNORE='&:ls:[bf]g:exit'
export TZ='America/New_York'

export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FORGIT_LOG_FORMAT="%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f ~/.forgit/forgit.plugin.sh ] && source ~/.forgit/forgit.plugin.sh
[ -f ~/.bashrc.local ] && source ~/.bashrc.local
[ -f /etc/bash_completion ] && ! shopt -oq posix && source /etc/bash_completion
[ -f ~/.git-completion.bash ] && source ~/.git-completion.bash
[ -f ~/.iterm2_shell_integration.bash ] && source ~/.iterm2_shell_integration.bash
[ -f ~/.git_prompt.sh ] && source ~/.git_prompt.sh

shopt -s globstar
shopt -s extglob
shopt -s checkwinsize
shopt -s histappend
shopt -s cmdhist
shopt -s cdspell
shopt -s dirspell

set colored-stats on

if [[ "$(uname -s)" != "Darwin" ]]; then
    alias ls='ls --color=auto'
else
    alias ls='gls --color=auto'
fi
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

function mail_html {
    mail -s "$(echo -e "Terminal Email\nContent-Type: text/html")"
}

if [[ "$(uname -s)" != "Darwin" ]]; then
    SMILEY='`if [ $? = 0 ]; then echo \[\e[32m\]:\)\[\e[37m\]; else echo \[\e[31m\]:\(\[\e[37m\]; fi`'
    # PS1="$SMILEY\[\e[36m\] @\h \w$(__git_ps1 " (%s)") $ \[\e[37m\]"
    PS1="$SMILEY\[\e[36m\] @\h \w $ \[\e[37m\]"
    PROMPT_COMMAND=
fi

# bind 'set show-all-if-ambiguous on'
# bind 'TAB:menu-complete'
# bind '"\e[Z":menu-complete-backward'

# tmux -S /tmp/<name>.shared new
# chmod 777 /tmp/<name>.shared

# gsutil perfdiag -o output.json -s 100M gs://<bucket>

# conda create --clone /n/local_nvme/conda_envs/ohka_env -p /n/gpfs0/latour_ssd/jpinkerton/conda_envs/shared_ohka_env
