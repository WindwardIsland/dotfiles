#!/usr/bin/env bash

# Taken and modified from: https://gitlab.com/thelinuxcast/scripts/-/blob/master/rsync.sh?ref_type=heads

uuid=$(findmnt -fn -o UUID /dev/sda1)
date=$(date +%Y.%m.%d-%H.%M.%S)
budir="/run/media/"$USER"/"$uuid"/"

sudo mkdir $budir/$date

sudo rsync -avpogEP /home/"$USER" "$budir"/"$date"

dunstify -u critical -i "$XDG_CONFIG_HOME"/dunst/icons/backup-icon.png "Backup running"
