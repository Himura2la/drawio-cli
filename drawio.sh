#!/bin/sh
if [ $# -eq 0 ]
then
    /app/drawio --no-sandbox --help
else
    /app/drawio --no-sandbox "$@"
fi
