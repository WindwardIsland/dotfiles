#!/bin/sh

# The "bar_action" script for Spectrwm. This script contains the information that will be displayed on the spectrwm bar.

##-- Prints the date --##
print_date() {
	DATE=$(date "+%m/%e/%y %l:%M %p" | sed 's/  / /g')
	echo "$DATE"
}

##-- Prints the battery --##
print_bat () {
	if [[ $(acpi -b | awk '/Battery 0:/ {print $3}' | awk -F "," '{print $1}') = "Discharging" ]]; then
		BAT_STATUS=$(acpi -b | sed 's/Discharging,/󱟞 /g' | awk '{print $3" "}') 
	elif [[ $(acpi -b | awk '/Battery 0:/ {print $3}' | awk -F "," '{print $1}') = "Charging" ]]; then
		BAT_STATUS=$(acpi -b | sed 's/Charging/󰂄 /g' | awk '{print $3" "}')
	fi
	BAT_PERCENTAGE=$(acpi -b | awk '/Battery 0:/ {print $4}' | awk -F "," '{print $1}')
	echo "$BAT_STATUS$BAT_PERCENTAGE"
}

##-- Prints out the current Wi-Fi network that's being connected to --##
print_wifi () {
	if [[ -z "$(nmcli | awk '/^wlp2s0: / {print $4}')" ]]; then
		WIFI_NETWORK="󰤭 "
	elif [[ "$(nmcli | awk '/^wlp2s0: / {print $4}')" = "to" ]]; then
		WIFI_NETWORK="󰤨  $(nmcli | awk '/^wlp2s0: / {print $4}' | sed 's/.*/.../g')"
	else
		WIFI_NETWORK="󰤨  $(nmcli | awk '/^wlp2s0: / {print $4}')"
	fi

	echo "$WIFI_NETWORK"
}

##-- Prints the amount of updates (both for pacman and the AUR) --##
# Taken from this script: https://github.com/polybar/polybar-scripts/blob/master/polybar-scripts/updates-pacman-aurhelper/updates-pacman-aurhelper.sh#LL4

# print_updates () {
# 	if ! updates_arch=$(checkupdates 2> /dev/null | wc -l ); then
#     	updates_arch=0
# 	fi

# 	# if ! updates_aur=$(yay -Qum 2> /dev/null | wc -l); then
# 	if ! updates_aur=$(paru -Qum 2> /dev/null | wc -l); then
# 	# if ! updates_aur=$(cower -u 2> /dev/null | wc -l); then
# 	# if ! updates_aur=$(trizen -Su --aur --quiet | wc -l); then
# 	# if ! updates_aur=$(pikaur -Qua 2> /dev/null | wc -l); then
# 	# if ! updates_aur=$(rua upgrade --printonly 2> /dev/null | wc -l); then
#     	updates_aur=0
# 	fi

# 	updates=$((updates_arch + updates_aur))

# 	if [ "$updates" -gt 0 ]; then
#     	echo "$updates 󰚰 "
# 	else
#     	echo "0 󰚰 "
# 	fi
# }

print_disk_left () {
	DISK_SPACE_LEFT=$(df -h | awk '/^\/dev\/nvme0n1p3/ {print $4}')
	echo "$DISK_SPACE_LEFT left 󰋊 "
}

##-- Prints out all of the information on the bar all at once using a while loop --##
while :; do
	echo "+@fg=1;$(print_updates)+@fg=0;| +@fg=7;$(print_disk_left)+@fg=0;| +@fg=4;$(print_bat) +@fg=0;| +@fg=6;$(print_wifi) +@fg=0;| $(print_date)" 
	sleep 1
done
