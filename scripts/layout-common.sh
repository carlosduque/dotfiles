#!/bin/zsh

SESSION=hack-the-world
tmux has-session -t $SESSION

if [ $? != 0 ]
then
    echo "starting ssh-agent..."
    eval $(ssh-agent -s)
    ssh-add $HOME/.ssh/*.key

    tmux new -s $SESSION -n home -d

    tmux rename-window -t $SESSION:1 "dev"
    tmux send-keys -t $SESSION:1.1  "cd $HOME" C-m
    tmux split-window -v -p 30 -t $SESSION:1.1

    tmux send-keys -t $SESSION:1.2  "cd $HOME" C-m
    tmux send-keys -t $SESSION:1.2  "clear" C-m
    tmux send-keys -t $SESSION:1.2  "lein repl" C-m
    tmux select-pane -t $SESSION:1.1

    # command
    tmux new-window -n "cmd"
    tmux send-keys -t $SESSION:2 "clear" C-m

    # docker
    tmux new-window -n "docker"
    tmux send-keys -t $SESSION:3 "clear" C-m
    tmux split-window -v -p 50 -t $SESSION:3.1
    #top pane
    tmux send-keys -t $SESSION:3.1 "docker ps -a" C-m
    #left pane
    tmux send-keys -t $SESSION:3.2 "docker images" C-m
    #right pane
    #tmux send-keys -t $SESSION:3.3  "cd $APP_DIR" C-m
    #tmux send-keys -t $SESSION:3.3  "docker-compose up" C-m
    tmux select-pane -t $SESSION:3.1

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

