#!/usr/bin/bash

if [[ $# -eq 1 ]]; then
  selected=$1
else
  selected=$(find ~/projects/ ~/work/ ~/notes/ -maxdepth 2 -type d | fzf)
fi

if [[ -z $selected ]]; then
  exit 0
fi

branch_name=""

if [[ -d "$selected/.git" ]]; then
	echo "Dir is a git dir"
	branch_name=$(git -C "$selected" branch | fzf | sed 's/\* //' | xargs)
fi

selected_name=$(basename "$selected" | tr . _)

if [[ -n $branch_name ]]; then
	selected_name="$selected_name-<$branch_name>"
fi

tmux_running=$(pgrep tmux)


if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
  tmux new-session -s $selected_name -c $selected
fi

if ! tmux has-session -t=$selected_name 2> /dev/null; then
  if [[ -n $branch_name ]]; then
    tmux new-session -s "$selected_name" -c "$selected" -d "git switch $branch_name; exec $SHELL"
  else
    tmux new-session -s "$selected_name" -c "$selected" -d
  fi
fi

tmux switch-client -t $selected_name

