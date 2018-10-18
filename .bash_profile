export PATH=$HOME/.miniconda3/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.neovim/bin:$PATH
export EDITOR=nvim
export HISTFILESIZE=10000
export HISTSIZE=200
export HISTCONTROL=ignoredups
export HISTIGNORE="&:ls:[bf]g:exit"
export TMX="tmux new -A -s main"
export MOYO="/mnt/disks/moyo/"

unset USERNAME

[ -f ~/.bashrc ] && source ~/.bashrc
