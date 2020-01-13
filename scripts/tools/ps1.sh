#!/usr/bin/env zsh

setopt prompt_subst

autoload -U add-zsh-hook
autoload -Uz vcs_info

add-zsh-hook precmd vcs_info

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*:prompt:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr '%F{green}●' # %c
zstyle ':vcs_info:*' unstagedstr '%F{yellow}●' #u
#zstyle ':vcs_info:*:*' actionformats "%S" "%r/%s/%b %u%c (%a)"
#zstyle ':vcs_info:*:*' formats "%S" "%r/%s/%b %u%c"
zstyle ':vcs_info:git:*' formats "%F{white}[%s%F{yellow}%b%c%u%F{red}%a%{$reset_color%}]"
zstyle ':vcs_info:*' check-for-changes true
#zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{11}%r'

# Check if we are on SSH or not
if [[ -n "$SSH_CLIENT"  ||  -n "$SSH2_CLIENT" ]]; then
  PR_HOST='@%M' # SSH
else
  PR_HOST='' # no SSH
fi

theme=$1
case $theme in
    stealth)
        PR_PROMPT="%{$fg_bold[cyan]%}§"
        export PROMPT="$PR_PROMPT %{$fg_bold[green]%}%c %{$fg_bold[yellow]%}» %{$reset_color%}"
        export RPROMPT="%{$fg[cyan]%}%n%{$fg[white]%}@%{$fg[yellow]%}%m%{$reset_color%}"
        ;;
    music)
        PR_PROMPT="%{$fg_bold[yellow]%}♪"
        export PROMPT="%{$fg_bold[green]%}%c ${PR_PROMPT} "
        export RPROMPT="%{$fg[white]%}%n%{$fg[cyan]%} ♫ %{$fg[blue]%}%m %{$reset_color%}"
        ;;
    pipe)
        PR_USER="%{$fg_bold[blue]%}%n%f"
        PR_USER_OP="%{$fg[blue]%}#%f"
        PR_PROMPT="%f➤ %f"
        local return_code="%(?..%F{red}%? ↵%f)"
        local user_host="${PR_USER}%F{cyan}@${PR_HOST}"
        local current_dir="%B%F{cyan}%~%f%b"
        PROMPT="╭─(${user_host} ${current_dir} $(git_current_branch)%{$reset_color%})
╰─$PR_PROMPT "
        RPROMPT="${return_code}"
        ;;
    slim)
        export PROMPT="%{$fg[magenta]%}%n%{$fg_bold[cyan]%}@%{$fg[yellow]%}%m%{$fg_bold[green]%}[%c] %{$reset_color%}"
        export RPROMPT="%T"
        ;;
    ice)
        export PROMPT="%{$fg_bold[cyan]%}%n%{$fg_bold[white]%}@%{$fg[blue]%}%m %{$reset_color%}%{$fg[blue]%}%c %(?,%{$fg_bold[white]%},%{$fg_bold[blue]%})» %{$reset_color%}"
        export RPROMPT="%{$fg_bold[white]%}%T"
        ;;
    lambda)
        export PROMPT="%{$fg_bold[white]%}λ %{$reset_color%}"
        #export RPROMPT="${vcs_info_msg_0_}%{$fg_bold[cyan]%}%T %{$reset_color%}"
        export RPROMPT="%{$fg_bold[white]%}$PR_HOST %{$fg[green]%}%C%{$fg[white]%}|%{$fg[yellow]%}%T %{$reset_color%}"
        ;;
    *)
        PR_PROMPT="%f$ %f"
        export PROMPT="%{$fg_bold[cyan]%}%c %{$reset_color%}"
        export RPROMPT="%{$fg[cyan]%}%T %{$reset_color%}"
        ;;
esac

