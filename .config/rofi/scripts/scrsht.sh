#!/usr/bin/env bash

gui="󱣴"
full="󰹑"
screen=""

show_menu() {
    echo -e "$gui\n$full\n$screen" | rofi -dmenu -config ~/.config/rofi/themes/scrsht.rasi 
}

choice=$(show_menu)

case $choice in
    $gui)
        flameshot gui
        ;;
    $full)
        flameshot full
        ;;
    $screen)
        flameshot screen
        ;;
    *)
        echo "Aborted"
        ;;
esac
