#!/usr/bin/env bash
export DISPLAY=":0"
Xvfb $DISPLAY &
alias drawio='/app/drawio --no-sandbox'
cd /
