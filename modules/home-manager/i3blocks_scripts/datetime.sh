#!/run/current-system/sw/bin/bash

# Source stylix colors
source "$HOME/.config/stylix/colors_env"

long_date_format="+%A %d %B, %H:%M"
short_date_format="%H:%M:%S"

echo " 󰃰  $(date "$long_date_format") "
echo " 󰃰  $(date "$short_date_format") "
echo "${COLOR_BASE06}"
