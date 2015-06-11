# setup tmux: always work in a tmux session if tmux is installed
# SESSION=hack
#if which tmux 2>&1 >/dev/null; then
#    if [ $TERM != "screen-256color" ] && [  $TERM != "screen" ]; then
#        tmux attach -t $SESSION || tmux new -s $SESSION; exit
#    fi

# Escape sequences: Colors
# Black       0;30     Dark Gray     1;30
# Blue        0;34     Light Blue    1;34
# Green       0;32     Light Green   1;32
# Cyan        0;36     Light Cyan    1;36
# Red         0;31     Light Red     1;31
# Purple      0;35     Light Purple  1;35
# Brown       0;33     Yellow        1;33
# Light Gray  0;37     White         1;37

print -P "\e[0;35m Host:    \e[1;35m%m"
print -P "\e[0;35m System:  \e[1;35m`uname -srm`\e[1;32m"
print -P "\e[0;35m Date:    \e[1;35m%D{%m.%d.%Y}"
print -P "\e[0;35m Time:    \e[1;35m%D{%H:%M}"

print -P "\e[1;36m"
[ fortune > /dev/null ] && [ cowsay > /dev/null ] && fortune -s | cowsay

