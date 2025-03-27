#!/bin/bash

DATE=$(date +'%Y-%M-%d')
UPTIME=$(uptime -p | sed 's/up //; s/ days/d/; s/ day/d/; s/ hours/h/; s/ hour/h/; s/ minutes/m/; s/ minute/m/; s/ seconds/s/; s/ second/s/; s/,//g; s/  */ /g; s/ $//')
MEMORY=$(free -m | awk '/Mem:/ {used=$3/1024; total=$2/1024; printf "%.2fGB / %.2fGB\n", used, total}')
DISK=$(df -h / | awk 'NR==2 {gsub(/iB/, "B", $2); gsub(/iB/, "B", $3); printf "%s / %s\n", $3, $2}')
CPU=$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {printf "%.1f%%\n", usage}')

echo "Date: $DATE"
echo "Uptime: $UPTIME"
echo "Memory: $MEMORY"
echo "Disk: $DISK"
echo "CPU: $CPU"
