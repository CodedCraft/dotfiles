#!/bin/bash

is_open=$(yabai -m query --windows --space 3 | jq '.[].app')


if [ "$is_open" == '"Firefox"' ]
then
   yabai -m space --focus 3
else
   /Applications/Firefox.app/Contents/MacOS/firefox --new-window https://cad.onshape.com/ \
            && osascript -e activate application "Firefox" \
            && sleep 1 \
            && yabai -m window --space 3;  yabai -m space --focus 3
fi
