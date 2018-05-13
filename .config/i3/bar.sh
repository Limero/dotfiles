#!/bin/bash

sleep 0.5
SINK=$(pacmd stat | awk -F": " '/^Default sink name: /{print $2}')

volume() {
  # Check if default sink is muted
  # TODO: print MUTED if muted else blank, instead of yes/no
  #pacmd list-sinks |
  #  awk '/^\s+name: /{indefault = $2 == "<'$SINK'>"}
  #       /^\s+muted: / && indefault {print $2; exit}'

  # Get volume of default sink
  pacmd list-sinks |
    awk '/^\s+name: /{indefault = $2 == "<'$SINK'>"}
         /^\s+volume: / && indefault {print $5; exit}'
}

spotify() {
  META=$(dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:org.mpris.MediaPlayer2.Player string:Metadata)
  sed -n '/artist/{n;n;p}' <<< $META | cut -d '"' -f 2
  echo '-'
  sed -n '/title/{n;p}' <<< $META | cut -d '"' -f 2
}

battery() {
  upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E percentage | awk '{print $2}'
  upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E time | awk '{print $4,$5}'
}

wifi() {
  # https://askubuntu.com/questions/282671/how-to-get-the-connected-wifi-network-ssid
  nmcli -t -f NAME connection show --active
}

while :
do
  echo $(spotify) '|' \
       $(volume) '|' \
       $(wifi) '|' \
       $(battery) '|' \
       $(date '+%a %b %d %H:%M:%S')
  sleep 1
done
