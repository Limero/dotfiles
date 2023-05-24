# Fedora

## Install

Reclaim disk space, encrypt disk, use SE-US keyboard layout, do NOT enable third-party repositories

## Setup Silverblue

### Enable unfiltered Flathub (required before F38)

```
flatpak remote-delete flathub
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

### Remove pre-installed Fedora flatpaks

```
flatpak remote-delete fedora
```

### Disable packages in base image

```
rpm-ostree override remove firefox firefox-langpacks
```

### Disable display manager

```
sudo systemctl disable gdm
```

### Set shell

```
# Set to /usr/bin/zsh
sudo lchsh $USER
```

### Enable auto updates

```
# Set `AutomaticUpdatePolicy=stage` in `/etc/rpm-ostreed.conf`
sudo rpm-ostree reload
sudo systemctl enable rpm-ostreed-automatic.timer --now
```

## Packages

### Repo

- rclone
- foot
- sway
- swaylock
- fzf
- neovim
- slurp
- grim
- wl-clipboard
- golang
- golang-x-tools-gopls
- bsdtar
- zsh-syntax-highlighting
- zsh-autosuggestions
- newsboat

### Flatpak (All from Flathub)

#### Open Source

- org.mozilla.firefox
- io.mpv.Mpv
- org.gimp.GIMP
- com.transmissionbt.Transmission
- org.signal.Signal
- com.github.Eloston.UngoogledChromium
- com.brave.Browser

#### Proprietary

- com.valvesoftware.Steam
- com.jagex.RuneScape
- net.runelite.RuneLite
- com.spotify.Client

### Other

```
env CGO_ENABLED=0 go install -ldflags="-s -w" github.com/gokcehan/lf@latest
```
