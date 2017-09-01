export PATH=$PATH:$HOME/bin
export PATH=$HOME/miniconda3/bin:$PATH
export PATH=$HOME/local/miniconda3/bin:$PATH
export GLOG_alsologtostderr=1
export GLOG_colorlogtostderr=1
export PATH="$HOME/.cargo/bin:$PATH"
unset USERNAME

[ -f ~/.bashrc ] && source ~/.bashrc
