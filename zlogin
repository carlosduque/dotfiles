# setup PATH variable
path+=('~/bin')
source ~/bin/setup_path_variable.sh

### Added by the Heroku Toolbelt, adapted to zsh
path=('/usr/local/heroku/bin' $path)
export PATH

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# aliases
alias zshconfig="vim ~/.zshrc"
alias vimconfig="vim ~/.vimrc"

# setup tmux: always work in a tmux session if tmux is installed
# SESSION=hack
#if which tmux 2>&1 >/dev/null; then
#    if [ $TERM != "screen-256color" ] && [  $TERM != "screen" ]; then
#        tmux attach -t $SESSION || tmux new -s $SESSION; exit
#    fi
#fi
