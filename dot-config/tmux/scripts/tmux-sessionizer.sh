#!/bin/bash

# Exit if tmux is not installed
if ! command -v tmux &> /dev/null; then
    echo "tmux is not installed. Exiting."
    exit 1
fi

default_find_line='~ -mindepth 1 -maxdepth 1 -type d'
extra_find_file="$HOME/.tmux-sessionizer-extra-finds"

# Example on how .tmux-sessionizer-extra-finds should looks like.
# Each line should contain a directory followed by its find options.
#
# ~/Developer -mindepth 1 -maxdepth 1 -type d
# ~/Worktrees -mindepth 1 -maxdepth 3 -type d


# Build results from default command and extra config file
results=$(
  {
    eval "find $default_find_line"
    # If the config file exists, process each line.
    if [[ -f "$extra_find_file" ]]; then
      while IFS= read -r line || [[ -n $line ]]; do
        # Skip empty lines and comments
        [[ -z "$line" || "$line" =~ ^# ]] && continue
        # Execute the find command defined on this line.
        eval "find $line"
      done < "$extra_find_file"
    fi
  }
)

selected=$(echo "$results" | fzf)
[[ -z "$selected" ]] && exit 0

# Derive a session name from the selected directory, then
#   remove any leading dot
selected_name=$(basename "$selected")
selected_name=${selected_name#.}

# Start the tmux server if tmux is not already running
if ! pgrep tmux &> /dev/null; then
    tmux start-server
fi

If not already inside a tmux session, create or attach the session
if [[ -z $TMUX ]]; then
    # Create a new session if it doesn't exist, or attach if it does
    if ! tmux has-session -t "$selected_name" 2>/dev/null; then
        tmux new-session -ds "$selected_name" -c "$selected"
    fi
    tmux attach-session -t "$selected_name"
else
    # We're already in a tmux session; switch to or create the target session
    if ! tmux has-session -t "$selected_name" 2>/dev/null; then
        tmux new-session -ds "$selected_name" -c "$selected"
    fi
    tmux switch-client -t "$selected_name"
fi
