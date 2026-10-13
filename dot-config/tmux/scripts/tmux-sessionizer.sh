#!/bin/bash

if ! command -v tmux >/dev/null 2>&1 || ! command -v fzf >/dev/null 2>&1; then
  printf 'tmux and fzf are required.\n' >&2
  exit 1
fi

extra_find_file="$HOME/.tmux-sessionizer-extra-finds"

# Each line: ~/Developer -mindepth 1 -maxdepth 1 -type d
# Paths may contain spaces; only numeric depths and directory searches are accepted.
find_directories() {
  find "$HOME" -mindepth 1 -maxdepth 1 -type d -print0
  [[ -f "$extra_find_file" ]] || return 0

  local line directory min_depth max_depth
  while IFS= read -r line || [[ -n "$line" ]]; do
    [[ "$line" =~ ^[[:space:]]*(#|$) ]] && continue
    if [[ ! "$line" =~ ^(.+)[[:space:]]+-mindepth[[:space:]]+([0-9]+)[[:space:]]+-maxdepth[[:space:]]+([0-9]+)[[:space:]]+-type[[:space:]]+d[[:space:]]*$ ]]; then
      printf 'Ignoring invalid find rule: %s\n' "$line" >&2
      continue
    fi

    directory="${BASH_REMATCH[1]}"
    min_depth="${BASH_REMATCH[2]}"
    max_depth="${BASH_REMATCH[3]}"
    case "$directory" in
      "~/"*) directory="$HOME/${directory#\~/}" ;;
      /*) ;;
      *) directory="$HOME/$directory" ;;
    esac
    if [[ -d "$directory" ]]; then
      find "$directory" -mindepth "$min_depth" -maxdepth "$max_depth" -type d -print0
    fi
  done < "$extra_find_file"
}

IFS= read -r -d '' selected < <(find_directories | fzf --read0 --print0) || exit 0

selected_name="${selected##*/}"
selected_name="${selected_name#.}"

if ! tmux has-session -t "=$selected_name" 2>/dev/null; then
  tmux new-session -ds "$selected_name" -c "$selected" || exit 1
fi

if [[ -n "$TMUX" ]]; then
  tmux switch-client -t "=$selected_name"
else
  tmux attach-session -t "=$selected_name"
fi
