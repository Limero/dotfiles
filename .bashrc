# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Change to saved working dir
[[ -f ~/.cwd ]] && cd "$(< ~/.cwd)" && rm ~/.cwd
# Save current working dir
alias s='pwd > ~/.cwd && pwd'

[ -f "$HOME/.config/aliases" ] && source "$HOME/.config/aliases"

alias ls='ls --color=auto --group-directories-first'
PS1='[\u@\h \W]\$ '

# Useful stuff
shopt -s autocd # cd to dir by typing directory name
HISTSIZE= HISTFILESIZE= # infinite history

c() {
  cd $1;
  ls;
}
alias cd='c'

iso2device() {
  # Usage: iso2device ubuntu-18.04.1-desktop-amd64.iso /dev/sda
  sudo dd bs=4M if=$1 of=$2 status=progress oflag=sync
}

yt() {
  a="${1%.*}"
  xdg-open https://invidio.us/watch?v="${a: -11}"
}


