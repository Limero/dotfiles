#!/bin/bash

sleep 0.5

volume() {
  [ "$(pulsemixer --get-mute)" = 1 ] && echo "Muted" && return
  vol="$(pulsemixer --get-volume)"
  echo "${vol%% *}"%
}

media() {
  # $1 can be spotify, ncspot etc.
  pidof "$1" >/dev/null || return
  META=$(dbus-send --print-reply --dest=org.mpris.MediaPlayer2."$1" /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:org.mpris.MediaPlayer2.Player string:Metadata)
  echo $(sed -n '/artist/{n;n;p}' <<< "$META" | cut -d '"' -f 2) '-' $(sed -n '/title/{n;p}' <<< "$META" | cut -d '"' -f 2)
}

battery() {
  for battery in /sys/class/power_supply/BAT?
  do
    [ -f "$battery"/capacity ] || break
    capacity=$(cat "$battery"/capacity)
    status=$(cat "$battery"/status)
    echo "$capacity""%" "$status"
  done
}

wifi() {
  # https://askubuntu.com/questions/282671/how-to-get-the-connected-wifi-network-ssid
  # --order type is to put wifi above docker
  nmcli -t -f NAME connection show --active --order type | head -1
}

while :
do
  echo "$(media spotify)" '|' \
       "$(volume)" '|' \
       "$(wifi)" '|' \
       "$(battery)" '|' \
       "$(date '+%a %b %d %H:%M:%S')"
  sleep 1
done
