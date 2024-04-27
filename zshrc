source ~/.aliases # Import Personal Aliases
source ~/.config/zsh/plugins/git-prompt.zsh # Import Prompt Git Status

# Enable VCS Built-In Service
prompt_git_setup

# Enable Zsh Built-In Autocompletion
autoload -U compinit; compinit

# Custom Prompt
OS=$(uname -s)
PROMPT='%F{blue}➜ %F{cyan}%~ %F{white}$(prompt_git_info)$(prompt_git_status)'

if [[  "$OS" == "Darwin" ]]; then
  PROMPT='%F{green}➜ %F{cyan}%~ %F{white}$(prompt_git_info)$(prompt_git_status)'
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
# Configuring Zsh without Dependencies: https://thevaluable.dev/zsh-install-configure-mouseless/
