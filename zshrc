source $HOME/dotfiles/zsh-antigen/antigen.zsh

# User configuration
export EDITOR=vim
#export BROWSER=$(which google-chrome chromium-browser firefox w3m links2 links lynx | grep -Pm1 '^/')
export TZ=America/Santiago

export BASE_PATH="/sbin:/bin:/usr/sbin:/usr/bin:/usr/games:/usr/local/sbin:/usr/local/bin"
if [[ "$OSTYPE" == "darwin"* ]]; then
    export CUSTOM_PATH="/Users/carlos/.rvm/bin:/Users/carlos/.rvm/gems/ruby-1.9.3-p484/bin"
    export CUSTOM_PATH=$CUSTOM_PATH:"/usr/local/git/bin:/usr/local/MacGPG2/bin"
    export CUSTOM_PATH=$CUSTOM_PATH:"/Library/Frameworks/JRuby.framework/Versions/Current/bin"
    export CUSTOM_PATH=$CUSTOM_PATH:"$(brew --prefix coreutils)/libexec/gnubin"
#elif [[ "$OSTYPE" == "freebsd"* ]]; then
#    export CUSTOM_PATH="~/bin"
elif [[ "$OSTYPE" == "cygwin" ]]; then
    export CUSTOM_PATH="C:\\Program Files\\Java\\jdk1.6.0_45\\bin:C:\\Users\\A07942A\\apps\\java\\apache-ant-1.9.4\\bin"
    export CUSTOM_PATH=$CUSTOM_PATH:"C:\\WINDOWS:C:\\WINDOWS\\System32"
    export CUSTOM_PATH=$CUSTOM_PATH:"C:\\WINDOWS\\System32\\WBEM:C:\\WINDOWS\\SYSTEM32\\WINDOWSPOWERSHELL\\V1.0\\"
    export CUSTOM_PATH=$CUSTOM_PATH:"C:\\Users\\A07942A\\apps\\HashiCorp\\Vagrant\\bin"
else
    #unknown
fi
export PATH=$BASE_PATH:$CUSTOM_PATH
export PATH=$PATH:~/bin
# export MANPATH="/usr/local/man:$MANPATH"

antigen use oh-my-zsh

antigen bundles <<EOBUNDLES
    git
    ant
    bundler
    gem
    jruby
    rails
    rake
    ruby
    tmux
    command-not-found
    # ZSH port of Fish shell's history search feature.
    zsh-users/zsh-history-substring-search
    # Syntax highlighting bundle.
    zsh-users/zsh-syntax-highlighting
    catimg
    encode64
    jsontools
    urltools
    vagrant
    vi-mode
    web-search
EOBUNDLES

if [[ "$OSTYPE" == "darwin"* ]]; then
      antigen-bundle osx
      antigen-bundle brew
fi

# Load the theme.
#antigen theme cloud
#antigen theme mrtazz
#antigen theme tjkirch
#antigen theme tonotdo
#antigen theme miloshadzic
antigen theme cypher
#
#antigen theme crunch
#antigen theme dallas
#antigen theme dieter
#antigen theme muse
#antigen theme pygmalion
#antigen theme smt
#antigen theme sunrise
#antigen theme gallois
#antigen theme wedisagree

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"


# You may need to manually set your language environment
# export LANG=en_US.UTF-8
export LC_ALL="es_ES.UTF-8"
export LC_COLLATE="C"

export LANG="es_ES.UTF-8"

# Preferred editor for local and remote sessions
export EDITOR='vim'

# aliases
alias zshconfig="vim ~/.zshrc"

# Always work in a tmux session if tmux is installed
if which tmux 2>&1 >/dev/null; then
  if [ $TERM != "screen-256color" ] && [  $TERM != "screen" ]; then
    tmux attach -t hack || tmux new -s hack; exit
  fi
fi

# Tell antigen that you're done.
antigen apply
