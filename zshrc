#zmodload zsh/zprof  # load zprof module
source $HOME/dotfiles/zsh-antigen/antigen.zsh

# User configuration
export EDITOR=vim
#export BROWSER=$(which google-chrome chromium-browser firefox w3m links2 links lynx | grep -Pm1 '^/')
export TZ=America/Santiago

# You may need to manually set your language environment
# export LANG=en_US.UTF-8
export LC_ALL="es_ES.UTF-8"
export LC_COLLATE="C"
export LANG="es_ES.UTF-8"

# # setup PATH variable
# export PATH=$PATH:~/bin
# source ~/bin/setup_path_variable.sh

antigen use oh-my-zsh

antigen bundles <<EOBUNDLES
    # git
    # ant
    # bundler
    # gem
    # jruby
    # rails
    # rake
    # ruby
    # tmux
    # command-not-found
    ### ZSH port of Fish shell's history search feature.
    zsh-users/zsh-history-substring-search
    ### Syntax highlighting bundle.
    zsh-users/zsh-syntax-highlighting
    catimg
    encode64
    jsontools
    urltools
    # vagrant
    # vi-mode
    # web-search
EOBUNDLES

if [[ "$OSTYPE" == "darwin"* ]]; then
      #antigen-bundle osx
      antigen-bundle brew
fi

# Load the theme.
### --short
#antigen theme cloud
#antigen theme theunraveler
#antigen theme carlosduque/oh-my-zsh-themes chess
antigen theme carlosduque/oh-my-zsh-themes stealth
#antigen theme mrtazz
#antigen theme miloshadzic
#antigen theme cypher
#antigen theme dieter
### --medium
#antigen theme gianu
#antigen theme pygmalion
#antigen theme tonotdo
#antigen theme smt
#antigen theme gallois
#antigen theme wedisagree
### --long
#antigen theme dallas
### --next-line
#antigen theme tjkirch

#antigen theme crunch
#antigen theme muse
#antigen theme sunrise

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Tell antigen that you're done.
antigen apply

#zprof  #zsh profiling


