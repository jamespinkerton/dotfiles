export PATH=$PATH:$HOME/bin
export PATH=$HOME/miniconda3/bin:$PATH
export PATH=$HOME/local/miniconda3/bin:$PATH
# export EDITOR=VIM
export GLOG_alsologtostderr=1
export GLOG_colorlogtostderr=1

shopt -s globstar
# From Facebook:
shopt -s checkwinsize

unset USERNAME

[ -f ~/.bashrc ] && source ~/.bashrc

# if [[ -n "$PS1" && -z "$TMUX" && -n "$(which tmux)" ]]; then
#     exec tmux new-session -A -s main #TODO: exec tmux without making it hard to ssh in
# fi

export PATH="$HOME/.cargo/bin:$PATH"
