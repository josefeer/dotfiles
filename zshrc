# Custom Prompts

OS=$(uname -s)
PROMPT='%F{blue}➜ %F{cyan}%~ %F{white}'

if [[  "$OS" == "Darwin" ]]; then
	PROMPT='%F{green}➜ %F{cyan}%~ %F{white}'
fi


# Personal Aliases
alias nvim-lazy="NVIM_APPNAME=LazyVim nvim"
alias nvim-astro="NVIM_APPNAME=AstroNvim nvim"

alias myip='curl -s ifconfig.me | cut -c 1-'

alias ssn="sudo shutdown now"
alias sr="sudo reboot"

alias ..="cd .."
alias ...="cd ../.."

alias psa="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"
alias psmem="ps auxf | sort -nr -k 4"
alias pscpu="ps auxf | sort -nr -k 3"

alias icat="kitten icat"

if command -v eza >/dev/null 2>&1; then
  alias ls='eza'
  alias lsa='eza -lah'
else
  alias ls='ls --color=auto'
  alias lsa='ls -lha --color=auto'
fi

# zoxide (improved cd)
eval "$(zoxide init --cmd cd zsh )"

# bat as manpager
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Enabling X11 forwarding
export XAUTHORITY=$HOME/.Xauthority

# References
# Classic oh-my-zsh prompt: https://stackoverflow.com/questions/68168011/how-to-alter-the-configuration-of-robbyrussel-theme-in-oh-my-zsh-so-that-the-arr
# Basic Color References: https://stackoverflow.com/questions/689765/how-can-i-change-the-color-of-my-prompt-in-zsh-different-from-normal-text
# Prompt values: https://superuser.com/questions/49092/how-to-format-the-path-in-a-zsh-prompt
