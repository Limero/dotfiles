# Requires qt5-wayland
export QT_QPA_PLATFORM=wayland-egl
#export GDK_BACKEND=wayland
export EDITOR=nvim
# Vim as a Manpager
export MANPAGER="/bin/sh -c \"col -b | vim --not-a-term -c 'set ft=man ts=8 nomod nolist noma' -\""

[ -n "$BASH" -a -f ~/.bashrc ] && . ~/.bashrc

#if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
#  exec startx
#fi

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  exec sway
fi
