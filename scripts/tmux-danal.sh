#!/bin/zsh

APP_HOME=/cygdrive/c/apps/java/jboss/jboss-eap-6.4.pid
SESSION=danal
#tmux attach -t danal || tmux new -s danal
tmux has-session -t $SESSION

if [ $? != 0 ]
then
    tmux new -s $SESSION -n home -d

    # open a window where the code is
    tmux rename-window -t $SESSION:1 "dev"
    tmux send-keys -t $SESSION:1 "cd $HOME/Documents/dev/experian/preciseid" C-m
    tmux send-keys -t $SESSION:1 "git log --oneline --decorate --graph" C-m

    # move to test dir
    tmux new-window -n "test"
    tmux send-keys -t $SESSION:2 "cd $HOME/Documents/experian/test/pid/ctl" C-m
    #split window to tail the server log
    tmux split-window -v -p 30 -t $SESSION:2
    #tmux split-window -h -p 50 -t $SESSION:2.2
    tmux send-keys -t $SESSION:2.2 "tail -f $APP_HOME/standalone/log/server.log" C-m
    tmux select-pane -t $SESSION:2.1

fi
tmux attach -t $SESSION
