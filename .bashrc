#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# Development
alias gp='git commit -am "`date`" && git push'
alias st='clear && git status'
alias m='make'
alias mc='make clean'

# OS Specific aliases
if [ -f /etc/arch-release ]; then
  # Arch
  if [ -x "$(command -v pacaur)" ]; then
    alias u='pacaur -Syu'
  else
    alias u='sudo pacman -Syu'
  fi
elif [ -f /etc/redhat-release ]; then
  # RHEL/CentOS/Fedora (untested)
  if [ -x "$(command -v dnf)" ]; then
    alias u='sudo dnf upgrade'
    alias clean='sudo dnf clean all'
  else
    alias u='sudo yum upgrade'
  fi
elif [ -f /etc/gentoo-release ]; then
  # Gentoo (untested)
  alias u='sudo sh -c "emerge --sync && emerge -avuND world"'
elif [ -f /etc/debian_version ]; then
  # Debian/Ubuntu (untested)
  alias u='sudo sh -c "apt update && apt upgrade"'
elif [ -x "$(command -v softwareupdate)" ]; then
  # macOS (untested)
  up() {
    if ! [ -x "$(command -v brew)" ]; then
      # Install homebrew and re-run
      /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" && up
    elif ! brew ls --versions cask-upgrade > /dev/null; then # may work without >
      # Install cu and re-run
      brew update && brew tap buo/cask-upgrade && up
    else
      brew update && brew cu && sudo softwareupdate -ia
    fi
  }
  alias u=updateMac
else
  alias u='echo Not supported on this platform'
fi

# Use powerline-daemon --replace to restart
if [ -x "$(command -v powerline-daemon)" ]; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  . /usr/lib/python3.6/site-packages/powerline/bindings/bash/powerline.sh
fi
