#!/usr/bin/env bash

CONFIG="/home/severin/.config/wofi/config/config"
STYLE="/home/severin/.config/wofi/src/macchiato/style.css"

if [[ ! $(pidof wofi) ]]; then
    wofi --conf "${CONFIG}" --style "${STYLE}"
else
    pkill wofi
fi
