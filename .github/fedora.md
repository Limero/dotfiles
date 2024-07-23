# Fedora

## Install

Reclaim disk space, encrypt disk, use SE-US keyboard layout, do NOT enable third-party repositories

## Setup Silverblue

### Enable unfiltered Flathub

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

#### Silverblue

```
sudo systemctl disable gdm
```

#### Sway Atomic

```
sudo systemctl disable sddm
```

### Set shell

```
chsh -s /usr/bin/zsh
```

### Enable auto updates

```
# Set `AutomaticUpdatePolicy=stage` in `/etc/rpm-ostreed.conf`
sudo rpm-ostree reload
sudo systemctl enable rpm-ostreed-automatic.timer --now
```

## Packages

### Part of Fedora Sway Atomic

- sway
- swaylock
- dunst
- foot
- slurp
- grim
- wl-clipboard

### Repo

- neovim
- nodejs
- sshfs
- cargo
- ripgrep
- fzf
- golang
- bsdtar
- zsh-syntax-highlighting
- zsh-autosuggestions
- newsboat

### Flatpak (All from Flathub)

#### Open Source

- org.mozilla.firefox
- io.mpv.Mpv
- org.gimp.GIMP
- org.signal.Signal

#### Proprietary

- com.valvesoftware.Steam
- com.jagex.RuneScape
- net.runelite.RuneLite
- com.spotify.Client
- com.slack.Slack
