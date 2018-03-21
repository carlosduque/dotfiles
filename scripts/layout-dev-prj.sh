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
BE_DIR="$PRJ_NAME-be"
FE_DIR="$PRJ_NAME-fe"
FE_BUILD_DIR="webpack"
tmux has-session -t $SESSION


if [ $? != 0 ]
then
    echo "starting ssh-agent..."
    eval $(ssh-agent -s)
    ssh-add $HOME/.ssh/*.key

    tmux new -s $SESSION -n home -d

    # open a window where the project is
    tmux rename-window -t $SESSION:1 "dev"
    tmux send-keys -t $SESSION:1.1  "cd $APP_DIR" C-m
    tmux send-keys -t $SESSION:1.1  "git ls --graph" C-m
    tmux split-window -v -p 30 -t $SESSION:1.1
    #start a python session
    tmux send-keys -t $SESSION:1.2  "clear" C-m
    tmux send-keys -t $SESSION:1.2  "python" C-m
    tmux select-pane -t $SESSION:1.1

    # open a window where the backend code is
    tmux new-window -n "be"
    tmux send-keys -t $SESSION:2.1  "cd $APP_DIR/$BE_DIR" C-m
    tmux send-keys -t $SESSION:2.1  "tree -L 4 ." C-m

    # open a window where the frontend is
    tmux new-window -n "fe"
    tmux send-keys -t $SESSION:3.1  "cd $APP_DIR/$FE_DIR" C-m
    tmux send-keys -t $SESSION:3.1  "tree -L 4 ." C-m

    # open a window where webpack is
    tmux new-window -n "webpack"
    tmux send-keys -t $SESSION:4.1  "cd $APP_DIR/$FE_BUILD_DIR" C-m
    tmux send-keys -t $SESSION:4.1  "clear" C-m
    tmux send-keys -t $SESSION:4.1  "npm -v" C-m
    tmux send-keys -t $SESSION:4.1  "tree -L 4 src" C-m
    tmux split-window -v -p 30 -t $SESSION:4.1
    #start dev server
    tmux send-keys -t $SESSION:4.2  "cd $APP_DIR/$FE_BUILD_DIR" C-m
    tmux send-keys -t $SESSION:4.2  "npm run dev" C-m
    tmux select-pane -t $SESSION:4.1

    # docker
    tmux new-window -n "docker"
    #top pane
    tmux send-keys -t $SESSION:5 "clear" C-m

    #top pane
    tmux send-keys -t $SESSION:5.1 "cd $APP_DIR" C-m
    tmux send-keys -t $SESSION:5.1 "docker ps -a" C-m
    tmux select-pane -t $SESSION:5.1

    # navigator
    tmux new-window -t $SESSION:6 -n "nav"
    tmux send-keys -t $SESSION:6.1 "cd $APP_DIR" C-m
    tmux send-keys -t $SESSION:6.1 "mc --nosubshell . $FE_BUILD_DIR" C-m

    # mail
    #tmux new-window -t $SESSION:4 -n "mail"
    #tmux send-keys "mutt" C-m

    # navigator
    #tmux new-window -t $SESSION:5 -n "explorer"
    #tmux send-keys "mc" C-m

    # remote 
    #tmux new-window -t $SESSION:6 -n "remote"
    #tmux send-keys "ssh carlos@pulhapanzak" C-m

    #go back to first window
    tmux select-window -t $SESSION:1
fi

tmux attach -t $SESSION

