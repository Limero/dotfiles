#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

export EDITOR=vim

# Development
alias gp='git commit -am "`date`" && git push'
alias st='clear && git status'
alias m='make'
alias mcl='make clean'
alias gb='git branch'
alias gch='git checkout'
alias gc='git commit'
alias gd='git diff'
alias gpu='git pull'

alias v='$EDITOR'
alias g='git'
alias r='ranger'
alias f='$EDITOR `fzf`'

alias bashrc='$EDITOR ~/.bashrc'
alias vimrc='$EDITOR ~/.vimrc'
alias i3config='$EDITOR ~/.config/i3/config'

alias h='http'
alias br='sudo vim /sys/class/backlight/intel_backlight/brightness'

# Directories
alias mapi='cd ~/IUS/mapi'

c() {
  cd $1;
  ls;
}
alias cd='c'

# OS Specific aliases
if [ -f /etc/arch-release ]; then
  # Arch
  if [ -x "$(command -v yay)" ]; then
    alias u='yay -Syu'
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
  alias u='sudo sh -c "emerge --sync && emerge -avuND @world"'
elif [ -f /etc/debian_version ]; then
  # Debian/Ubuntu (untested)
  alias u='sudo sh -c "apt update && apt upgrade"'
else
  alias u='echo Not supported on this platform'
fi

