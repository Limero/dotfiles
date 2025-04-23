# macOS

## Install

### Homebrew

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Podman

```
brew install podman
podman machine init
podman machine start
sudo /opt/homebrew/Cellar/podman/4.4.2/bin/podman-mac-helper install
```

### Fuse for SSH mounting

```
brew tap macos-fuse-t/homebrew-cask
brew install fuse-t
brew install fuse-t-sshfs
```

## Packages

### Homebrew

- ghostty
- fzf
- lf
- ripgrep
- mpv
- yt-dlp
- newsboat
- zsh-autosuggestions
- zsh-syntax-highlighting
- go
- rust
- firefox
- brave-browser
- gimp
- utm
- signal
- transmission
- spotify

### AppStore

- [Wireguard](https://apps.apple.com/us/app/wireguard/id1451685025)

## Packages for work

### Homebrew

- librdkafka
- jq
- helm
- kubernetes-cli
- node
- docker
- awscli
- visual-studio-code
- slack
- glab

### AppStore

- [Barracuda CG Access](https://apps.apple.com/us/app/barracuda-cg-access/id1444786360)
