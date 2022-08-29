#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
export MOZ_USE_XINPUT2=1 # enable touch navigation in firefox
export MOZ_ENABLE_WAYLAND=1 # enable gpu acceleration in firefox
export PATH="$PATH:~/.local/bin/"

if [[ "$(tty)" = "/dev/tty1" ]]; then
	sway 2>> ~/.logsway # autostart sway on boot
fi
