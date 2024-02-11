#!/usr/bin/env bash

{
    if [[ $(tmux has-session -t $1) != "" ]]
    then
        dir=get_dir
        tmux new-session -d -s $1 -c $dir
    fi
    tmux attach-session -c $1
}

function get_dir {
    if [[ $2 == "" ]]
    then
        echo ~
    else
        echo $2
    fi
}
