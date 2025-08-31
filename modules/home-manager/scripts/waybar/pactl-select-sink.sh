#!/run/current-system/sw/bin/bash

# Get available sinks (names + descriptions)
sinks=$(pactl list short sinks | awk '{print $2}')

# Current default sink
default=$(pactl info | grep "Default Sink" | awk '{print $3}')

# Build menu with rofi
chosen=$(echo "$sinks" | rofi -dmenu -i -p "Audio Sink: " -theme ~/.config/rofi/themes/launcher.rasi)

# If user picked something
if [ -n "$chosen" ]; then
    pactl set-default-sink "$chosen"

    # Also move currently playing streams to new sink
    for input in $(pactl list short sink-inputs | awk '{print $1}'); do
        pactl move-sink-input "$input" "$chosen"
    done
fi
