#!/bin/bash
CONFIG_DIR='.config'

dirs=`ls -la . -I .git -I . -I .. | grep ^d | awk '{print $9}'`

for dir in $dirs
do
  if [[ -d "$(pwd)/${dir}" ]]; then
    if [[ -d "${HOME}/${CONFIG_DIR}/${dir}" ]]; then
      rsync -avu --delete\
        --exclude '.git'\
        --exclude '/themes/.git'\
        --exclude '/plugins/'\
        "${HOME}/${CONFIG_DIR}/${dir}/" "$(pwd)/${dir}"
    fi
  fi
done
