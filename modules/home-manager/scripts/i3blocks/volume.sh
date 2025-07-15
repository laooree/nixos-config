#!/run/current-system/sw/bin/bash

# Source stylix colors
source "$HOME/.config/stylix/colors_env"

volume=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+?(?=%)' | head -1)
mute=$(pactl get-sink-mute @DEFAULT_SINK@ | grep -oE '(yes|no)')
color="${COLOR_BASE06}"

icon=" "

if [ "$volume" = 0 ] || [ "$mute" = "yes" ]; then
    icon=" "
    color="${COLOR_BASE03}"
fi

output=" $icon $volume% "

echo "$output"
echo "$output"
echo "$color"
