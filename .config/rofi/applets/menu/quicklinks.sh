#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

style="$($HOME/.config/rofi/applets/menu/style.sh)"

dir="$HOME/.config/rofi/applets/menu/configs/$style"
rofi_command="rofi -theme $dir/quicklinks.rasi"

# Error msg
msg() {
	rofi -theme "$HOME/.config/rofi/applets/styles/message.rasi" -e "$1"
}

# Browser
if [[ -f /usr/bin/brave ]]; then
    app="brave"
elif [[ -f /usr/bin/firefox ]]; then
	app="firefox"
elif [[ -f /usr/bin/chromium ]]; then
	app="chromium"
elif [[ -f /usr/bin/midori ]]; then
	app="midori"
else
	msg "No suitable web browser found!"
	exit 1
fi

# Links
archwiki=""
youtube=""
mail=""
github=""
twitter=""
messenger=""

# Variable passed to rofi
#options="$google\n$facebook\n$twitter\n$github\n$mail\n$youtube"
options="$youtube\n$mail\n$github\n$archwiki\n$twitter\n$messenger"

chosen="$(echo -e "$options" | $rofi_command -p "Open In  :  $app" -dmenu -selected-row 0)"
case $chosen in
    $archwiki)
        $app https://wiki.archlinux.org &
        ;;
    $youtube)
        $app https://www.youtube.com &
        ;;
    $mail)
        $app https://www.gmail.com &
        ;;
    $github)
        $app https://www.github.com &
        ;;
    $messenger)
        $app https://www.messenger.com &
        ;;
    $twitter)
        $app https://www.twitter.com &
        ;;
esac
