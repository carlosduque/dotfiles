#!/bin/zsh
#tmux attach -t hack || tmux new -s hack

#ssh pdb61
tmux send-keys -t $SESSION:1 "ssh mckvdatpdb61" C-m
tmux rename-window -t $SESSION:1 "pdb61"

# precisematch
tmux new-window -n "precisematch"
tmux send-keys -t $SESSION:2 "cd ~/dev/experian/frdbigdata/precisematch-mapred-indexer" C-m
tmux split-window -h
tmux split-window -v
tmux send-keys -t $SESSION:2.3 "irb" C-m
tmux select-pane -t 1

