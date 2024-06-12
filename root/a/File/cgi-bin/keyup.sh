#!/bin/bash
key=`python3 decoder.py "$QUERY_STRING"`
export DISPLAY=:1
#xdotool keydown "$key"
xdotool keyup "$key"
