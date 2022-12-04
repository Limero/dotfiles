#!/bin/bash

sleep 0.5

volume() {
  vol="$(wpctl get-volume @DEFAULT_AUDIO_SINK@)"

  [ "$vol" != "${vol%\[MUTED\]}" ] && echo "Muted" && return

  vol="${vol#Volume: }"
  split() {
    # For ommiting the . without calling and external program.
    IFS=$2
    set -- $1
    printf '%s' "$@"
  }
  vol="$(split "$vol" ".")"
  echo "${vol##0}"%
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
    capacity=$(cat "$battery"/capacity 2>/dev/null) || break
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
  echo "$(media mpv)" '|' \
       "$(volume)" '|' \
       "$(wifi)" '|' \
       "$(battery)" '|' \
       "$(date '+%a %b %d %H:%M:%S')"
  sleep 1
done
