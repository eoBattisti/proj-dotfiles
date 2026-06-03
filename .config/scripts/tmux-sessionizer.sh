#!/usr/bin/bash

if [[ $# -eq 1 ]]; then
  selected=$1
else
  selected=$(find ~/projects/ ~/work/ ~/notes/ -maxdepth 2 -type d | fzf)
fi

selected_name=$(basename "$selected" | tr . _)

if [[ -z $selected ]]; then
  exit 0
fi

branch_name=""
if [[ -d "$selected/.git" ]]; then
	branch_name=$(git -C "$selected" worktree list | fzf | cut -d " " -f 1 | xargs)
fi


if [[ -n $branch_name ]]; then
	selected_branch_name=$(basename "$branch_name" | tr . _)
	selected=$branch_name
	selected_name="$selected_name-<$selected_branch_name>"
fi

tmux_running=$(pgrep tmux)


if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
  tmux new-session -s $selected_name -c $selected
fi

if ! tmux has-session -t=$selected_name 2> /dev/null; then
  if [[ -n $branch_name ]]; then
    tmux new-session -s "$selected_name" -c "$selected" -d 
  else
    tmux new-session -s "$selected_name" -c "$selected" -d
  fi
fi

tmux switch-client -t $selected_name

