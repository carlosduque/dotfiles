# To the extent possible under law, the author(s) have dedicated all
# copyright and related and neighboring rights to this software to the
# public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along
# with this software.
# If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

# base-files version 4.2-3

# ~/.bashrc: executed by bash(1) for interactive shells.

# The latest version as installed by the Cygwin Setup program can
# always be found at /etc/defaults/etc/skel/.bashrc

# Modifying /etc/skel/.bashrc directly will prevent
# setup from updating it.

# The copy in your home directory (~/.bashrc) is yours, please
# feel free to customise it to create a shell
# environment to your liking.  If you feel a change
# would be benifitial to all, please feel free to send
# a patch to the cygwin mailing list.

# User dependent .bashrc file

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# Shell Options
#
# See man bash for more options...
#
# Don't wait for job termination notification
# set -o notify
#
# Don't use ^D to exit
# set -o ignoreeof
#
# Use case-insensitive filename globbing
# shopt -s nocaseglob
#
# Make bash append rather than overwrite the history on disk
# shopt -s histappend
#
# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
# shopt -s cdspell
export LSCOLORS="Gxfxcxdxbxegedabagacad"

PROMPT="%{$fg_bold[cyan]%}§ %{$fg_bold[green]%}%c %{$fg_bold[yellow]%}» %{$reset_color%}"

# User configuration
export EDITOR=vim
#export BROWSER=$(which google-chrome chromium-browser firefox w3m links2 links lynx | grep -Pm1 '^/')
export TZ=America/Santiago

# setup PATH variable
export PATH=$PATH:~/bin
. ~/bin/setup_env_vars.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8
export LC_ALL="es_ES.UTF-8"
export LC_COLLATE="C"

export LANG="es_ES.UTF-8"

# aliases
alias zshconfig="vim ~/.zshrc"
alias vimconfig="vim ~/.vimrc"

# Always work in a tmux session if tmux is installed
if which tmux 2>&1 >/dev/null; then
    if [ $TERM != "screen-256color" ] && [  $TERM != "screen" ]; then
        tmux attach -t hack || tmux new -s hack; exit
    fi
fi
