#!/run/current-system/sw/bin/bash

# Source stylix colors
source "$HOME/.config/stylix/colors_env"

long_date_format="+%A %d %B, %H:%M"
short_date_format="%H:%M:%S"

echo " 󰃰  $(LC_TIME=en_US.UTF-8 date "$long_date_format") "
echo " 󰃰  $(LC_TIME=en_US.UTF-8 date "$short_date_format") "
echo "${COLOR_BASE06}"
