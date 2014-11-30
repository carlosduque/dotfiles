#!/bin/zsh
#tmux attach -t hack || tmux new -s hack

SANDBOX_DIR="/Users/carlos/Codigo/java/sandbox"
COURSES_DIR="/Users/carlos/Codigo/code-for-courses"

# dev 
tmux new-window -n "dev"
tmux split-window -h
tmux split-window -v

tmux send-keys -t hack:2.1 "cd $SANDBOX_DIR/fortune-ejb" C-m
tmux send-keys -t hack:2.1 "ls -lah" C-m
tmux send-keys -t hack:2.2 "mc" C-m
tmux send-keys -t hack:2.3 "cd $SANDBOX_DIR/fortune-ejb" C-m
tmux send-keys -t hack:2.3 "javac -version" C-m
tmux select-pane -t 1

# algorithms
tmux new-window -t hack:3 -n "algorithms"
tmux split-window -h
tmux split-window -v

tmux send-keys -t hack:3.1 "cd $COURSES_DIR/algorithms" C-m
tmux send-keys -t hack:3.1 "ls -R src/" C-m
tmux send-keys -t hack:3.2 "cd $COURSES_DIR/algorithms" C-m
tmux send-keys -t hack:3.2 "vim excercises.md" C-m
tmux select-pane -t 1

# remote 
tmux new-window -t hack:4 -n "remote"
tmux send-keys "ssh beastie" C-m
tmux split-window -v
tmux select-pane -t 1

# go back to window 1
tmux select-window -t hack:1

