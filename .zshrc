# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/david/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

# Development
alias gp='git commit -am "`date`" && git push'
alias st='clear && git status'
alias m='make'
alias mcl='make clean'

alias v='vim'
alias g='git'

alias zshrc='vim ~/.zshrc'
alias vimrc='vim ~/.vimrc'
alias i3config='vim ~/.config/i3/config'

c() {
  cd $1;
  ls;
}
alias cd='c'

alias t='i3-sensible-terminal --default-working-directory="$PWD"'
alias ttt='i3 split h && t && i3 split v && t && i3 resize shrink width && i3 resize shrink width && i3 split h && clear && ls -la'

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
