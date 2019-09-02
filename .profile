# Requires qt5-wayland
# Virtualbox currently crashes with it enabled
# https://www.virtualbox.org/ticket/18679
#export QT_QPA_PLATFORM=wayland-egl
export QT_QPA_PLATFORMTHEME=gtk3
#export GDK_BACKEND=wayland
export EDITOR=nvim

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  exec sway
fi
