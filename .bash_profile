export PATH=$HOME/miniconda3/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.neovim/bin:$PATH
export TMX="tmux new -A -s main"
export EDITOR=nvim
unset GLOG_logtostderr
unset GLOG_alsologtostderr
unset GLOG_colorlogtostderr
unset USERNAME
export MOYO="/mnt/disks/moyo/"
export HISTFILESIZE=10000
export HISTSIZE=2000

[ -f ~/.bashrc ] && source ~/.bashrc
