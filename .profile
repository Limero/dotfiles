#export GDK_BACKEND=wayland
export MOZ_ENABLE_WAYLAND=1
export EDITOR=nvim
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH="$PATH:$GOBIN:$HOME/.local/bin:$HOME/.local/share/flatpak/exports/bin:/var/lib/flatpak/exports/bin"

# For Sway on non-systemd
if test -z "${XDG_RUNTIME_DIR}"; then
  export XDG_RUNTIME_DIR=/tmp/$(id -u)-runtime-dir
  if ! test -d "${XDG_RUNTIME_DIR}"; then
    mkdir "${XDG_RUNTIME_DIR}"
    chmod 0700 "${XDG_RUNTIME_DIR}"
  fi
fi

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  export _JAVA_AWT_WM_NONREPARENTING=1
  exec sway
fi

# macOS
if [[ "$OSTYPE" == "darwin"* ]]; then
  export GOPRIVATE=gitlab.com/junitechnology/*
  export GO111MODULE=on
  #export GOROOT=/opt/homebrew/bin
  # util-linux paths for setsid and such commands
  export PATH="/opt/homebrew/opt/util-linux/bin:/opt/homebrew/opt/util-linux/sbin:$PATH"
  export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl/lib/pkgconfig"
fi
