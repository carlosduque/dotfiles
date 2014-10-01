#!/bin/zsh
#tmux attach -t hack || tmux new -s hack

tmux split-window -h
tmux split-window -v
tmux split-window -h
tmux select-pane -t 4
tmux send-keys "irb" C-m

tmux new-window -t hack:2 -n "monitor"
tmux send-keys "top" C-m
tmux split-window -h
tmux select-pane -t 2
tmux split-window -v
tmux select-pane -t 3
tmux send-keys "tail -f /var/log/messages" C-m

tmux select-window -t hack:1
tmux select-pane -t 1
tmux send-keys "vim" C-m
tmux select-pane -t 2
