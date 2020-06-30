#!/bin/bash

SESSION=`basename $PWD`

tmux -2 new-session -d -s $SESSION

tmux rename-window -t $SESSION:1 vim
tmux split-window -h
tmux select-pane -t 0
tmux resize-pane -R 40


tmux select-window -t $SESSION:1
tmux -2 attach -t $SESSION

