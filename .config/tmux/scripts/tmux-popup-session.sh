#!/bin/bash

# Define the name of the popup session
session="popup"

# Check if the popup session already exists
if tmux has-session -t "$session" 2>/dev/null; then
    # If the session exists, check if it's currently attached
    if [ "$(tmux display-message -p -t "$session" '#{session_attached}') " -eq 1 ]; then
        # If attached, detach it (hide the popup)
        tmux detach-client -s "$session"
    else
        # If not attached, attach it (show the popup)
        tmux display-popup  -w 80% -h 80% -E "tmux attach-session -t $session"
    fi
else
    # If the session doesn't exist, create it and attach
    tmux new-session -ds "$session"
    tmux display-popup -w 80% -h 80% -E "tmux attach-session -t $session"
fi
