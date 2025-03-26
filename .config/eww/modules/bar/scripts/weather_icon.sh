#!/bin/sh

KEY="e434b5435a979de6e155570590bee89b"
CITY="Perm"
UNITS="metric"
SYMBOL="°"


SUN=""   
CLOUD="󰅟"  
RAIN=""   
SNOW=""   
MIST=""   

API="https://api.openweathermap.org/data/2.5"

if [ -n "$CITY" ]; then
    if [ "$CITY" -eq "$CITY" ] 2>/dev/null; then
        CITY_PARAM="id=$CITY"
    else
        CITY_PARAM="q=$CITY"
    fi

    weather=$(curl -sf "$API/weather?appid=$KEY&$CITY_PARAM&units=$UNITS")
else
    location=$(curl -sf https://location.services.mozilla.com/v1/geolocate?key=geoclue)

    if [ -n "$location" ]; then
        location_lat="$(echo "$location" | jq '.location.lat')"
        location_lon="$(echo "$location" | jq '.location.lng')"

        weather=$(curl -sf "$API/weather?appid=$KEY&lat=$location_lat&lon=$location_lon&units=$UNITS")
    fi
fi

if [ -n "$weather" ]; then
    weather_temp=$(echo "$weather" | jq ".main.temp" | cut -d "." -f 1)
    weather_icon=$(echo "$weather" | jq -r ".weather[0].icon")
    
    # Map weather icons to nerd font icons based on OpenWeatherMap icon codes
    case "$weather_icon" in
        "01"*) ICON="$SUN" ;;    # Clear
        "02"*|"03"*|"04"*) ICON="$CLOUD" ;;  # Clouds
        "09"*|"10"*) ICON="$RAIN" ;;  # Rain
        "11"*) ICON="$RAIN" ;;  # Thunderstorm (using rain icon)
        "13"*) ICON="$SNOW" ;;  # Snow
        "50"*) ICON="$MIST" ;;  # Mist/Fog
        *) ICON="$CLOUD" ;;  # Default to cloud
    esac

    echo "$ICON"
fi
