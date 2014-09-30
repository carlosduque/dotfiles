source $HOME/dotfiles/zsh-antigen/antigen.zsh

# User configuration
export EDITOR=vim
export BROWSER=$(which google-chrome chromium-browser firefox w3m links2 links lynx | grep -Pm1 '^/')
export TZ=America/Santiago

export COMMON_PATH="/sbin:/bin:/usr/sbin:/usr/bin:/usr/games:/usr/local/sbin:/usr/local/bin:/home/carlos/bin"
export MAC_PATH="/Users/carlos/.rvm/bin:/Users/carlos/.rvm/gems/ruby-1.9.3-p484/bin:/usr/local/git/bin:/usr/local/MacGPG2/bin:/Library/Frameworks/JRuby.framework/Versions/Current/bin"
export CYG_PATH="C:\\Program Files\\Java\\jdk1.6.0_45\\bin:C:\\Users\\A07942A\\apps\\java\\apache-ant-1.9.4\\bin"
export PATH=$COMMON_PATH:$MAC_PATH:$CYG_PATH
export PATH=$PATH:~/.bin
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
EOBUNDLES

if [ "$OSTYPE"="darwin11.0" ]; then
      antigen-bundle osx
fi

# Load the theme.

#ZSH_THEME="miloshadzic"
#ZSH_THEME="tonotdo"
#ZSH_THEME="gallois"
#ZSH_THEME="cloud"
#ZSH_THEME="tjkirch"
antigen theme wedisagree

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
