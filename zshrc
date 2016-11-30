#zmodload zsh/zprof  # load zprof module
source $HOME/dotfiles/zgen/zgen.zsh

if ! zgen saved; then
  zgen oh-my-zsh

  ### ZSH port of Fish shell's history search feature.
  zgen load zsh-users/zsh-history-substring-search
  ### Syntax highlighting bundle.
  zgen load zsh-users/zsh-syntax-highlighting
  # zgen load catimg
  # zgen load encode64
  # zgen load jsontools
  # zgen load urltools

  if [[ "$OSTYPE" == "darwin"* ]]; then
        zgen load brew
  fi

  # Load the theme.
  #antigen theme carlosduque/oh-my-zsh-themes chess
  zgen load carlosduque/oh-my-zsh-themes stealth
  #zgen load carlosduque/oh-my-zsh-themes chess
  #zgen load carlosduque/oh-my-zsh-themes ice 
fi

CASE_SENSITIVE="true"
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# initializers
eval "$(rbenv init -)"

# Print a random, hopefully interesting, adage.
print -P "\e[1;36m"
$(type fortune &> /dev/null) && $(type cowsay &> /dev/null) && fortune -s | cowsay

#zprof  #zsh profiling

