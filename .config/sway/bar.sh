#!/bin/bash

sleep 0.5

volume() {
  if [[ $(pulsemixer --get-mute) = 1 ]]; then
    echo "MUTED"
  fi

  pulsemixer --get-volume | awk '{print $1;}'
}

media() {
  # $1 can be spotify, ncspot etc.
  META=$(dbus-send --print-reply --dest=org.mpris.MediaPlayer2.$1 /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:org.mpris.MediaPlayer2.Player string:Metadata)
  echo $(sed -n '/artist/{n;n;p}' <<< $META | cut -d '"' -f 2) '-' $(sed -n '/title/{n;p}' <<< $META | cut -d '"' -f 2)
}

battery() {
  # Currently requires upower. Find solution without dependencies
  upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E percentage | awk '{print $2}'
  upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E time | awk '{print $4,$5}'
}

wifi() {
  # https://askubuntu.com/questions/282671/how-to-get-the-connected-wifi-network-ssid
  # --order type is to put wifi above docker
  nmcli -t -f NAME connection show --active --order type | head -1
}

while :
do
  echo $(media spotify) '|' \
       $(volume) '|' \
       $(wifi) '|' \
       $(battery) '|' \
       $(date '+%a %b %d %H:%M:%S')
  sleep 1
done
