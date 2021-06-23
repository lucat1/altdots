#
# Executes commands at the start of an interactive session.
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# start sway on login
if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
  mkdir -p /tmp/wayland
  XDG_RUNTIME_DIR=/tmp/wayland dbus-run-session sway
fi

# aliases
alias ls=exa
alias ll="exa -al"
alias gpg=gpg2 # make gpg work
alias sxiv='imv'
alias vi="nvim"

# git alias to manage dotfiles
# see: https://www.atlassian.com/git/tutorials/dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME'
