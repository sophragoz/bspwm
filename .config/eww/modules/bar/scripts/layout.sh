#!/bin/bash
layout=$(xkb-switch -p | awk -F'(' '{print $1}')

case $layout in
	us) echo "US" ;;
	ru) echo "RU" ;;
	*) echo "not found layout" ;;
esac
