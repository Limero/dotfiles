#export GDK_BACKEND=wayland
export MOZ_ENABLE_WAYLAND=1
export EDITOR=nvim
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH="$PATH:$GOBIN:$HOME/.local/share/flatpak/exports/bin"

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  exec sway
fi

# macOS
if [[ "$OSTYPE" == "darwin"* ]]; then
  export GOPRIVATE=gitlab.com/junitechnology/*
  export GO111MODULE=on
  #export GOROOT=/opt/homebrew/bin
  # util-linux paths for setsid and such commands
  export PATH="/opt/homebrew/opt/util-linux/bin:/opt/homebrew/opt/util-linux/sbin:$PATH"
fi
