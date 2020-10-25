#!/bin/bash

SESSION=`basename $PWD`

# create a session
tmux -2 new-session -d -s $SESSION

# neovim window
tmux rename-window -t $SESSION:1 nvim
tmux split-window -h
tmux select-pane -t 0
tmux resize-pane -R 40

# git window
tmux new-window -t $SESSION -a -n git

# select the first window
tmux select-window -t $SESSION:1
tmux -2 attach -t $SESSION
