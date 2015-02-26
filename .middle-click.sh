#!/bin/bash

echo "Setting user keycodes..."
# set XKB layout
setxkbmap -layout de 
# turn on mousekeys
xkbset m
# stop mousekeys expiring after a timeout
#xkbset exp =m
# map keysym to other keysym
# xmodmap -e "keysym Menu = Pointer_Button2"
# xmodmap -e "keysym Caps_Lock = Pointer_Button2"
# this also works
# xmodmap -e "keycode 135 = Pointer_Button2"
xmodmap -e "keycode 66 = Pointer_Button2"
#Workaround for working numpad
xmodmap -e "keycode 87 = 1"
xmodmap -e "keycode 88 = 2"
xmodmap -e "keycode 89 = 3"
xmodmap -e "keycode 83 = 4"
xmodmap -e "keycode 84 = 5"
xmodmap -e "keycode 85 = 6"
xmodmap -e "keycode 79 = 7"
xmodmap -e "keycode 80 = 8"
xmodmap -e "keycode 81 = 9"
xmodmap -e "keycode 90 = 0"
xmodmap -e "keycode 106 = slash"
#xmodmap -e "keycode 92 = asterisk asterisk asterisk asterisk"
xmodmap -e "keycode 82 = minus"
xmodmap -e "keycode 86 = plus"
xmodmap -e "keycode 91 = comma comma comma comma"
echo "Done"

exit 0