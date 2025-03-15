#!/usr/bin/env bash

poweroff=""
reboot=""
logout="󰈆"

show_menu() {
    echo -e "$poweroff\n$logout\n$reboot" | rofi -dmenu -config ~/.config/rofi/themes/power.rasi 
}

choice=$(show_menu)

case $choice in
    $poweroff)
        /usr/sbin/poweroff
        ;;
    $logout)
        bspc quit
        ;;
    $reboot)
        /usr/sbin/reboot 
        ;;
    *)
        echo "Canceled"
        ;;
esac
