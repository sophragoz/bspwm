#!/bin/bash

# Using a search, find the latitude and longitude of your city and enter the two values.
# Default: Perm/Russia
LATITUDE=58.01
LONGITUDE=56.25

URL="https://api.open-meteo.com/v1/forecast?latitude=${LATITUDE}&longitude=${LONGITUDE}&daily=temperature_2m_max&timezone=auto&forecast_days=7"

DATA=$(curl -s "$URL")

DATES=$(echo "$DATA" | jq -r '.daily.time[]')
MAX_TEMPS=$(echo "$DATA" | jq -r '.daily.temperature_2m_max[]')

DAYS=("Mon" "Tue" "Wed" "Thu" "Fri" "Sat" "Sun")

mapfile -t DATE_ARRAY <<< "$DATES"
mapfile -t TEMP_ARRAY <<< "$MAX_TEMPS"

START_DAY=$(date -d "${DATE_ARRAY[0]}" +%u)  
SHIFT=$(( (1 - START_DAY + 7) % 7 ))  

for ((i=0; i<7; i++)); do
    DAY_INDEX=$(( (i + SHIFT) % 7 ))
    TEMP_INDEX=$(( (i + SHIFT) % 7 ))
    printf "%-3s %2.0f°\n" "${DAYS[$DAY_INDEX]}:" "${TEMP_ARRAY[$TEMP_INDEX]}"
done
