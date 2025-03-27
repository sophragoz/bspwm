#!/bin/bash

hour=$(date +%H)
NAME="Sophron Ragozin"

if [ $hour -ge 5 ] && [ $hour -lt 12 ]; then
  echo "Good morning"
elif [ $hour -ge 12 ] && [ $hour -lt 18 ]; then
  echo "Good day"
else
  echo "Good night"
fi

