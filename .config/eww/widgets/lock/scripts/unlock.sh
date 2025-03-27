#!/bin/bash
killall sxhkd &&
sxhkd -c ~/.config/sxhkd/sxhkdrc &
eww close lock-menu &&
eww close lock-blur &
