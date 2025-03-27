#!/bin/bash

# Coordinates for desired location (default: Perm, Russia)
LATITUDE=58.01
LONGITUDE=56.25
URL="https://nominatim.openstreetmap.org/reverse?lat=${LATITUDE}&lon=${LONGITUDE}&format=json"

DATA=$(curl -s "$URL")

COUNTRY=$(echo "$DATA" | jq -r '.address.country')
CITY=$(echo "$DATA" | jq -r '.address.city // .address.town // .address.village // "Unknown"')

printf "%s/%s\n" "$COUNTRY" "$CITY"
