#!/usr/bin/env sh

source $HOME/bin/tools/gitinfo
if [ "$UID" != "0" ]; then # normal user
   PR_PROMPT="%{$fg_bold[red]%}%f➤ %f"
else # root
   PR_PROMPT='%F{red}# %f'
fi

theme=$1
case $theme in
    stealth)
        PR_PROMPT="%{$fg_bold[white]%}%f➤ %f"
        export PROMPT="%{$fg_bold[cyan]%}§ %{$fg_bold[green]%}%c %{$fg_bold[yellow]%}» %{$reset_color%}"
        export RPROMPT="%{$fg[cyan]%}%n%{$fg[white]%}@%{$fg[yellow]%}%m%{$reset_color%}"
        ;;
    music)
        PR_PROMPT="%{$fg_bold[yellow]%}♪ %{$reset_color%}"
        export PROMPT="%{$fg_bold[green]%}%c ${PR_PROMPT}"
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
        export RPROMPT="%t"
        ;;
    ice)
        export PROMPT="%{$fg_bold[cyan]%}%n%{$fg_bold[blue]%}@%{$fg[cyan]%}%m %{$reset_color%}%{$fg[blue]%}%c %(?,%{$fg_bold[white]%},%{$fg_bold[blue]%})» %{$reset_color%}"
        export RPROMPT="%{$fg[magenta]%}$(git_prompt_info)%{$reset_color%} $(git_prompt_status)%{$reset_color%}"
        ;;
    lambda)
        export PROMPT="%{$fg_bold[white]%}λ %{$reset_color%}"
        export RPROMPT="%{$fg_bold[green]%}%T %{$reset_color%}"
        ;;
    *)
        PR_PROMPT="%f$ %f"
        export PROMPT="%{$fg_bold[cyan]%}%c %{$reset_color%}"
        export RPROMPT="%{$fg[cyan]%}%T %{$reset_color%}"
        ;;
esac

