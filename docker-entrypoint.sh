#!/usr/bin/env bash
export DISPLAY=":0"
xvfb ":0" &
/app/drawio --no-sandbox "$@"
