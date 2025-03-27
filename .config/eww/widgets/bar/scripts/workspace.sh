output=$(bspc query -D --names)

if [ $? -ne 0 ]; then
  echo "[]"
  exit 1
fi

# Extract the active workspace
active=$(bspc query -D -d focused --names)

# Extract all workspace names
workspaces=$(echo "$output")

# Format as JSON for EWW
echo "["
echo "$workspaces" | while read -r ws; do
  active_bool=$([ "$ws" = "$active" ] && echo "true" || echo "false")
  echo "  { \"name\": \"$ws\", \"active\": $active_bool },"
done | sed '$ s/,$//'
echo "]"
