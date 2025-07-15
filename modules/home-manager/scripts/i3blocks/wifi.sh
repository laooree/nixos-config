#!/run/current-system/sw/bin/bash

# Source stylix colors
source "$HOME/.config/stylix/colors_env"

wifi_info=$(nmcli -t -f ACTIVE,SSID,SIGNAL dev wifi | grep "^yes:")

if [ -z "$wifi_info" ]; then
  output="󰤮  Disconnected"
  color="${COLOR_BASE03}"
else
  IFS=':' read -r _ ssid signal <<< "$wifi_info"

  output="   ($signal%) $ssid "
  color="${COLOR_BASE06}"
fi

echo "$output"
echo "$output"
echo "$color"
