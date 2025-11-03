#!/usr/bin/env bash

cd $(tmux run "echo #{pane_current_path}" 2>/dev/null || pwd)
url=$(git remote get-url origin)

if [[ $url == *github.com* ]]; then
  if [[ $url == git@* ]]; then
    url="${url#git@}"
    url="${url/:/\/}"
    url="https://$url"
  fi
  open "$url"
else
  echo "No Git remote found."
fi
