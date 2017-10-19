export PATH=$HOME/miniconda3/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.neovim/bin:$PATH
export GLOG_alsologtostderr=1
export GLOG_colorlogtostderr=1
export TMX="tmux new -A -s main"
export EDITOR=nvim
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

unset USERNAME

[ -f ~/.bashrc ] && source ~/.bashrc

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jamespinkerton/google-cloud-sdk/path.bash.inc' ]; then source '/Users/jamespinkerton/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jamespinkerton/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/jamespinkerton/google-cloud-sdk/completion.bash.inc'; fi
