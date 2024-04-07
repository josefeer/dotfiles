# zoxide (improved cd)
eval "$(zoxide init --cmd cd zsh )"

# bat as manpager
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Enabling X11 forwarding
export XAUTHORITY=$HOME/.Xauthority
