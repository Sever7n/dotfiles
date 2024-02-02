#!/usr/bin/env bash

{
    if [[ $(tmux has-session -t $1) -eq "can't find session: ${1}" ]]
    then
        tmux a -t $1
    else
        tmux new -t $1
    fi
} &> /dev/null
