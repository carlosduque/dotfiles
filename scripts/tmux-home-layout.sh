#!/bin/zsh

SESSION=wp
PRJ_DIR="$HOME/dev/projects"
tmux has-session -t $SESSION

if [ $? != 0 ]
then
    echo "starting ssh-agent..."
    eval $(ssh-agent -s)
    ssh-add $HOME/.ssh/*.key

    tmux new -s $SESSION -n home -d

    # open a window where the code is
    tmux rename-window -t $SESSION:1 "dev"
    tmux send-keys -t $SESSION:1  "cd $HOME" C-m

    # docker
    tmux new-window -n "docker"
    tmux send-keys -t $SESSION:2 "clear" C-m
    tmux send-keys -t $SESSION:2 "tail -f $PRJ_DIR/webpay/woocommerce/env/wp/wc-logs/oraqus-wc-transbank-*.log" C-m
    tmux split-window -v -p 30 -t $SESSION:2.1
    tmux split-window -h -p 50 -t $SESSION:2.2
    tmux send-keys -t $SESSION:2.2 "cd $PRJ_DIR/webpay/woocommerce" C-m
    tmux send-keys -t $SESSION:2.2 "git log --oneline --decorate --graph" C-m
    tmux send-keys -t $SESSION:2.3  "cd $PRJ_DIR/webpay/woocommerce/env" C-m
    tmux send-keys -t $SESSION:2.3  "docker-compose up -d" C-m
    tmux select-pane -t $SESSION:2.3

    # remote 
    tmux new-window -t $SESSION:3 -n "remote"
    tmux send-keys "ssh carlos@pulhapanzak" C-m

    tmux select-window -t $SESSION:1
fi

tmux attach -t $SESSION

