# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Change to saved working dir
[[ -f ~/.cwd ]] && cd "$(< ~/.cwd)" && rm ~/.cwd
# Save current working dir
alias s='pwd > ~/.cwd && pwd'

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

export EDITOR=vim

# Useful stuff
shopt -s autocd # cd to dir by typing directory name
HISTSIZE= HISTFILESIZE= # infinite history
#set -o vi

# Vim as a Manpager
export MANPAGER="/bin/sh -c \"col -b | vim --not-a-term -c 'set ft=man ts=8 nomod nolist noma' -\""

# Development
alias gp='git commit -am "`date`" && git push'
alias gs='clear && git status'
alias m='make'
alias mcl='make clean'
alias gch='git checkout'
alias gc='git commit'
alias gd='git diff'
alias gpu='git pull'
alias gm='$EDITOR -p $(git ls-files -m --exclude-standard --others)'

alias v='$EDITOR'
alias g='git'
alias r='ranger'
alias mh='neomutt -F ~/.config/mutt/account.home && exit'
alias mw='neomutt -F ~/.config/mutt/account.work && exit'
alias nb='newsboat'

alias bashrc='$EDITOR ~/.bashrc'
alias vimrc='$EDITOR ~/.vimrc'
alias i3conf='$EDITOR ~/.config/i3/config'
alias tconf='$EDITOR ~/.config/alacritty/alacritty.yml'
alias rssconf='$EDITOR ~/.config/newsboat/config'
alias mconf='$EDITOR ~/.config/mutt/muttrc'

alias mpvc='mpv --really-quiet $(wl-paste) & disown && exit'
alias unp='unp -U'
alias f='cd "$(vifm . --choose-dir - $@)"'
alias eip='curl icanhazip.com'
alias ff='GDK_BACKEND=wayland firefox'

# Directories
alias ius='cd ~/ius'
alias mapi='ius && cd mapi && git status'
alias fpapi='ius && cd fpapi-vasttrafik && git status'
alias fp='ius && cd fp-vasttrafik && git status'
alias dockius='ius && cd dockius && git status'

alias phpunit='vendor/phpunit/phpunit/phpunit'
alias ws='cd ~/ius/dockius && docker-compose exec --user=dockius workspace bash -c "cd fpapi-vasttrafik && bash"'
alias startius='cd ~/ius/dockius && ./start.sh'
alias seed='clear && php artisan migrate:dropall --force && php artisan migrate:all --seed'
alias reseed='clear && php artisan db:reseed'
alias fplog='docker logs -f $(docker ps -aq --filter name=fp-vasttrafik)'
alias fixfp='sudo rm -rf ~/ius/fp-vasttrafik/node_modules && docker rm -f $(docker ps -aq --filter name=fp-vasttrafik) || startius'

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
