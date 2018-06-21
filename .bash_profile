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
export MD_MOYO="/mnt/disks/moyo/md-moyo"
export MD_ARCHIVE="/mnt/disks/moyo/md-archive"

[ -f ~/.bashrc ] && source ~/.bashrc

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jamespinkerton/google-cloud-sdk/path.bash.inc' ]; then source '/Users/jamespinkerton/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jamespinkerton/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/jamespinkerton/google-cloud-sdk/completion.bash.inc'; fi
