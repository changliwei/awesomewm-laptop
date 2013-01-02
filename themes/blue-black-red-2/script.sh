#!/bin/bash

# THEMEDIR=$HOME"/.config/awesome/themes/blue-black-red-2"

## SEE $XDG_CONFIG_HOME/awesome/custom/
## If wanting to regenerate every themes script.sh from the default_script.

## Run from terminal:

## sh $XDG_CONFIG_HOME/awesome/custom/script_regeneration.sh

# killall conky
# #killall idesk
# sleep 1
# conky -d -c "$HOME"/.config/conky/.conkyrw &
# sleep 1
# conky -d -c "$HOME"/.config/conky/.conkyweather &
# sleep 1
# conky -d -c "$HOME"/.config/conky/distro/archlinux/distro.ck &
# sleep 1
nitrogen --restore &
exit 0