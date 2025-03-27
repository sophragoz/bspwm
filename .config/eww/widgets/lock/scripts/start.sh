#!/bin/bash
killall sxhkd && 
sxhkd -c ~/.config/eww/widgets/lock/scripts/bind & 
eww open lock-blur &&
eww open lock-menu &

