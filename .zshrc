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

# https://danishprakash.github.io/2018/07/06/git-branch-zsh.html
function git_branch() {
    branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
    if [[ $branch == "" || $(pwd) == $HOME ]]; then
        :
    else
        echo '('$branch') '
    fi
}
setopt prompt_subst
PROMPT='%F{green}%2~%f %F{blue}$(git_branch)%f$ '

# Set window title
precmd () {print -Pn "\e]0;%n@%M:%~\a"}

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

# correct spelling mistakes
setopt correct

# Ctrl+arrow key to move word like bash
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# https://stackoverflow.com/questions/67793356/how-can-one-scroll-through-multi-line-commands-in-the-zsh-history-without-select
bindkey '^P' up-history
bindkey '^N' down-history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots) # Include hidden files.

# https://codeberg.org/dnkl/foot/issues/628
bindkey "\e[27;2;13~" accept-line # shift+return
bindkey "\e[27;5;13~" accept-line # ctrl+return
bindkey -s "\e[27;2;27~" "" # shift+esc
bindkey -s "\e[27;5;27~" "" # ctrl+esc
bindkey -s "\e[27;9;27~" "" # meta+esc
bindkey -s "\e[27;5;59~" "" # ctrl+;
bindkey -s "\e[27;5;39~" "" # ctrl+'
bindkey -s "\e[27;5;44~" "" # ctrl+,
bindkey -s "\e[27;5;46~" "" # ctrl+.
bindkey -s "\e[27;6;58~" "" # ctrl+shift+;
bindkey -s "\e[27;6;34~" "" # ctrl+shift+'
bindkey -s "\e[27;6;60~" "" # ctrl+shift+,
bindkey -s "\e[27;6;62~" "" # ctrl+shift+.
bindkey -s "\e[27;6;63~" "" # ctrl+shift+/
bindkey -s "\e[27;6;13~" "" # ctrl+shift+enter
bindkey "\e[1;2A"     up-line-or-history   # shift+up
bindkey "\e[1;2B"     down-line-or-history # shift+down
bindkey "\e[1;2D"     backward-word        # shift+left
bindkey "\e[1;2C"     forward-word         # shift+right

source "$HOME/.config/aliases"

# Arch Linux
[ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Fedora
[ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# macOS
[ -d /opt/homebrew/Cellar/zsh-autosuggestions/ ] && source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -d /opt/homebrew/Cellar/zsh-syntax-highlighting/ ] && source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
