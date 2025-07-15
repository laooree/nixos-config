#!/run/current-system/sw/bin/bash

# Source stylix colors
source "$HOME/.config/stylix/colors_env"

icon=" "  # You can change this to suit your font

# Get disk usage for root partition
read -r used total <<< $(df -h --output=used,size / | tail -n 1)

echo " $icon $used/$total "
echo " $icon $used/$total "
echo "${COLOR_BASE06}"
