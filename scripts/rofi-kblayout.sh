# !/usr/bin/bash

chosen=$(localectl list-x11-keymap-layouts | rofi -dmenu -i -theme-str '@import "~/.config/rofi/power.rasi"')

setxkbmap $chosen
