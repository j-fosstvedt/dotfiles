#!/bin/bash
#  ____ _____
# |  _ \_   _|  Derek Taylor (DistroTube)
# | | | || |    http://www.youtube.com/c/DistroTube
# | |_| || |    http://www.gitlab.com/dwt1/
# |____/ |_|
#
# Dmenu script for editing some of my more frequently edited config files.
declare -a options=("alacritty"
"awesome"
"bash"
"fish"
"pacman"
"picom"
"qtile"
"xmobar"
"xmonad"
"xresources"
"quit"
)
# The combination of echo and printf is done to add line breaks to the end of each
# item in the array before it is piped into dmenu.  Otherwise, all the items are listed
# as one long line (one item).
#choice=$(echo "$(printf '%s\n' "${options[@]}")" | dmenu -p 'Edit config file: ')
choice=$(echo "$(printf '%s\n' "${options[@]}")" | dmenu -p 'Edit config file: ')
case "$choice" in
	alacritty)
		choice="$HOME/.config/alacritty/alacritty.yml"
	;;
	awesome)
		choice="$HOME/.config/awesome/rc.lua"
	;;
	bash)
		choice="$HOME/.bashrc"
	;;
	fish)
		choice="$HOME/.config/fish/config.fish"
	;;
	pacman)
		choice="/etc/pacman.conf"
	;;
	picom)
		choice="$HOME/.config/picom/picom.conf"
	;;
	qtile)
		choice="$HOME/.config/qtile/config.py"
	;;
	xmobar)
		choice="$HOME/.config/xmobar/xmobarrc2"
	;;
	xmonad)
		choice="$HOME/.xmonad/xmonad.hs"
	;;
	*)
		exit 1
	;;
esac

# Ultimately, what do want to do with our choice?  Open in our editor!
alacritty -e sudo nano "$choice"