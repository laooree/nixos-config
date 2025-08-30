#!/run/current-system/sw/bin/bash

# Define options (using Nerd Font icons, replace with plain text if you prefer)
options="    Power off\n    Reboot\n    Suspend\n    Logout"

# Use your existing rofi config.rasi
chosen=$(echo -e "$options" | rofi -dmenu -i -p "" -theme ~/.config/rofi/themes/launcher.rasi)

case "$chosen" in
    "    Power off") systemctl poweroff ;;
    "    Reboot") systemctl reboot ;;
    "    Suspend") systemctl suspend ;;
    "    Logout") swaymsg exit ;;
esac
