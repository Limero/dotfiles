# Dotfiles

## Dotfiles setup

Clone with HTTPS

```
cd ~
git init
git remote add origin https://github.com/Limero/dotfiles.git
git fetch
git checkout -f master
```

Later add SSH key and set remote to SSH instead

```
install -m 600 /dev/null ~/.ssh/id_rsa
git remote set-url origin git@github.com:Limero/dotfiles.git
```

## Operating system setup

* [Arch Linux](archlinux.md)
* [Fedora](fedora.md)
* [macOS](macos.md)
