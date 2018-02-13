#!/bin/sh

SINK=$(pacmd stat | awk -F": " '/^Default sink name: /{print $2}')

volume() {
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

while :
do
  echo $(spotify) '|' \
       $(volume) '|' \
       $(date '+%a %b %d %H:%M:%S')
  sleep 1
done
