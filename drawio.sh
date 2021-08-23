#!/bin/sh

export DISPLAY=:0
if [ ! -f /tmp/.X0-lock ]
then
    Xvfb $DISPLAY &
fi

if [ $# -eq 0 ]
then
    /app/drawio --no-sandbox --help
else
    /app/drawio --no-sandbox "$@"
fi
