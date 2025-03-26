#!/bin/bash

LATITUDE=58.01
LONGITUDE=56.25
URL="https://api.open-meteo.com/v1/forecast?latitude=${LATITUDE}&longitude=${LONGITUDE}&daily=windspeed_10m_max&timezone=auto&forecast_days=1"

if ! command -v curl &> /dev/null || ! command -v jq &> /dev/null; then
    echo "jq and curl not found"
    exit 1
fi

DATA=$(curl -s "$URL")

if [ $? -ne 0 ]; then
    echo "Fail in request"
    exit 1
fi

MAX_WIND=$(echo "$DATA" | jq -r '.daily.windspeed_10m_max[0]')
WIND_MS=$(echo "$MAX_WIND / 3.6" | bc -l)
printf "%.0f m/s\n" "$WIND_MS"
