#!/bin/bash

pidof dunst && killall dunst
dunst -config ~/.config/dunst/dunstrc &

notify-send --urgency=low "Title one" "message one"
notify-send --urgency=normal "Title two" "message twoaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
notify-send --urgency=critical "Title three" "message three"
