#!/bin/zsh

PRJ_NAME=$1

if [ -z "$PRJ_NAME" ]
then
    echo "usage: sh $0 <project name>"
    exit
fi

SESSION=hack-$PRJ_NAME
PRJ_DIR="$HOME/dev/projects"
APP_DIR="$PRJ_DIR/$PRJ_NAME"
tmux has-session -t $SESSION


if [ $? != 0 ]
then
    echo "starting ssh-agent..."
    eval $(ssh-agent -s)
    ssh-add $HOME/.ssh/*.key

    tmux new -s $SESSION -n home -d

    # open a window where the code is
    tmux rename-window -t $SESSION:1 "cmd"
    tmux send-keys -t $SESSION:1.1  "cd $HOME" C-m
    tmux split-window -v -p 30 -t $SESSION:1.1
    #start a python session
    tmux send-keys -t $SESSION:1.2  "python" C-m
    tmux select-pane -t $SESSION:1.1

    # project
    tmux new-window -t $SESSION:2 -n "dev"
    tmux send-keys "cd $PRJ_DIR" C-m

    # docker
    tmux new-window -n "docker"
    #top pane
    tmux send-keys -t $SESSION:3 "clear" C-m
    tmux send-keys -t $SESSION:3 "cd $APP_DIR" C-m
    tmux split-window -v -p 30 -t $SESSION:3.1
    tmux split-window -h -p 50 -t $SESSION:3.2
    #left pane
    tmux send-keys -t $SESSION:3.2 "cd $APP_DIR" C-m
    tmux send-keys -t $SESSION:3.2 "git log --oneline --decorate --graph" C-m
    #right pane
    tmux send-keys -t $SESSION:3.3  "cd $APP_DIR/env" C-m
    tmux send-keys -t $SESSION:3.3  "docker-compose up" C-m
    tmux select-pane -t $SESSION:3.1

    # mail
    tmux new-window -t $SESSION:4 -n "mail"
    tmux send-keys "mutt" C-m

    # navigator
    tmux new-window -t $SESSION:5 -n "explorer"
    tmux send-keys "mc" C-m

    # remote 
    tmux new-window -t $SESSION:6 -n "remote"
    tmux send-keys "ssh carlos@pulhapanzak" C-m

    #go back to first window
    tmux select-window -t $SESSION:1
fi

tmux attach -t $SESSION

