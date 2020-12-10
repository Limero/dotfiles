#export GDK_BACKEND=wayland
export MOZ_ENABLE_WAYLAND=1
export EDITOR=nvim
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH="$PATH:$GOBIN:$HOME/.local/share/flatpak/exports/bin"

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  exec sway
fi
