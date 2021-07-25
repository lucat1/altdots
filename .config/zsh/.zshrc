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
  export MOZ_ENABLE_WAYLAND=1
  XDG_RUNTIME_DIR=/tmp/wayland XDG_CURRENT_DESKTOP=sway XDG_SESSION_TYPE=wayland \
    dbus-run-session sway
fi

# aliases
alias ls=exa
alias ll="exa -al"
alias vi="nvim"

# git alias to manage dotfiles
# see: https://www.atlassian.com/git/tutorials/dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME'
