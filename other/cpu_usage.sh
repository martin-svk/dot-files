#!/bin/bash

# This script is used in my tmux status line.
# Make sure it is located in your PATH variable.

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    # Linux
    cat <(grep 'cpu ' /proc/stat) <(sleep 1 && grep 'cpu ' /proc/stat) |
        awk -v RS="" '{ printf "%3.2f", ($13-$2+$15-$4)*100/($13-$2+$15-$4+$16-$5) }'
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # Mac OSX
    ps -A -o %cpu | awk '{s+=$1} END {print s "%"}'
fi

