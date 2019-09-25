# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/david/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

case $TERM in
  xterm*)
    precmd () {print -Pn "\e]0;%n@%M:%~\a"}
    ;;
esac

# https://unix.stackexchange.com/questions/310540/how-to-get-rid-of-no-match-found-when-running-rm
setopt +o nomatch

# https://stackoverflow.com/questions/3964068/zsh-automatically-run-ls-after-every-cd
function chpwd() {
    emulate -L zsh
    ls -a
}

# Ignore lines prefixed with '#'.
setopt interactivecomments

# Ignore duplicate in history.
setopt hist_ignore_dups

# Prevent record in history entry if preceding them with at least one space
setopt hist_ignore_space

# Disable flow control CTRL+S/Q
setopt noflowcontrol

# Ctrl+arrow key to move word like bash
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# https://danishprakash.github.io/2018/07/06/git-branch-zsh.html
function git_branch() {
    branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
    if [[ $branch == "" ]]; then
        :
    else
        echo '('$branch') '
    fi
}
setopt prompt_subst
PROMPT='%F{green}%2~%f %F{blue}$(git_branch)%f$ '

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots) # Include hidden files.

source "$HOME/.config/aliases"
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
