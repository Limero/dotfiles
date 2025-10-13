export EDITOR=nvim
export MANPAGER='nvim +Man!'
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH="$HOME/.local/share/bob/nvim-bin:$GOBIN:$HOME/.cargo/bin:$HOME/.local/bin:$HOME/.local/share/flatpak/exports/bin:/var/lib/flatpak/exports/bin:$PATH"

if command -v sway >/dev/null; then
  #export GDK_BACKEND=wayland
  export MOZ_ENABLE_WAYLAND=1

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
fi

# macOS
if [[ "$OSTYPE" == "darwin"* ]]; then
  export GOPRIVATE=gitlab.com/junitechnology/*
  export GO111MODULE=on
  #export GOROOT=/opt/homebrew/bin
  export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl/lib/pkgconfig"
  export PATH="/Applications/Firefox.app/Contents/MacOS:$PATH"
  export PATH="$HOME/.docker/bin:$PATH"
fi
