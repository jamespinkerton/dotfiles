# export PATH=$HOME/.miniconda3/bin:$PATH
# export PATH=$HOME/miniconda3/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.neovim/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export EDITOR=nvim
export HISTFILESIZE=10000
export HISTSIZE=200
export HISTCONTROL=ignoredups
export HISTIGNORE="&:ls:[bf]g:exit"
export TMX="tmux new -A -s main"
export TZ='America/New_York'
# export TZ=/usr/share/zoneinfo/US/Eastern

unset USERNAME
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
[ -f ~/.bashrc ] && source ~/.bashrc
