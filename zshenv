# User configuration
export EDITOR=vim
#export BROWSER=$(which google-chrome chromium-browser firefox w3m links2 links lynx | grep -Pm1 '^/')
export TZ=America/Santiago

# You may need to manually set your language environment
# export LANG=en_US.UTF-8
export LC_ALL="es_ES.UTF-8"
export LC_COLLATE="C"
export LANG="es_ES.UTF-8"

# setup PATH variable
path+=($HOME/bin)
source $HOME/bin/setup_env_vars.sh

### Added by the Heroku Toolbelt, adapted to zsh
path=('/usr/local/heroku/bin' $path)
export PATH

#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# aliases
alias zshconfig="vim $HOME/.zshrc"
alias vimconfig="vim $HOME/.vimrc"

