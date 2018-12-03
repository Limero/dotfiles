#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

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

alias br='sudoedit /sys/class/backlight/intel_backlight/brightness'

# Directories
alias ius='cd ~/ius'
alias mapi='ius && cd mapi && git status'
alias fpapi='ius && cd fpapi-vasttrafik && git status'
alias fp='ius && cd fp-vasttrafik && git status'
alias dockius='ius && cd dockius && git status'

alias phpunit='vendor/phpunit/phpunit/phpunit'
alias ws='cd ~/ius/dockius && docker-compose exec --user=dockius workspace bash'
alias startius='cd ~/ius/dockius && ./start.sh'
alias seed='clear && php artisan migrate:dropall --force && php artisan migrate:all --seed'
alias reseed='clear && php artisan db:reseed'
alias fplog='docker logs -f $(docker ps -aq --filter name=fp-vasttrafik)'
alias fixfp='sudo rm -rf ~/ius/fp-vasttrafik/node_modules && docker rm -f $(docker ps -aq --filter name=fp-vasttrafik) || cd ~/ius/dockius && ./start.sh'

c() {
  cd $1;
  ls;
}
alias cd='c'
