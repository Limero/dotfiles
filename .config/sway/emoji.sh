#!/bin/sh

chosen=$(grep -v "#" ~/.config/emoji | bemenu --fn 'monospace 18' -p 'emoji:' -l 10 -i -w)

[ "$chosen" != "" ] || exit

c=$(echo "$chosen" | sed "s/ .*//")
echo "$c" | tr -d '\n' | wl-copy

