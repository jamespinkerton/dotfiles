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
export MD_MOYO="/mnt/disks/moyo/md_moyo"

[ -f ~/.bashrc ] && source ~/.bashrc
