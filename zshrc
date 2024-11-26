source ~/.aliases # Import Personal Aliases
source ~/.config/zsh/plugins/git-prompt.zsh # Import Prompt Git Status

# Custom Plugins
source <(fzf --zsh)
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Enable VCS Built-In Service
prompt_git_setup

# Custom Prompt
OS=$(uname -s)
PROMPT='%F{blue}➜ %F{cyan}%~ %F{white}$(prompt_git_info)$(prompt_git_status)'

if [[  "$OS" == "Darwin" ]]; then
  PROMPT='%F{green}➜ %F{cyan}%~ %F{white}$(prompt_git_info)$(prompt_git_status)'
fi

# zoxide (improved cd)
eval "$(zoxide init zsh)"

# bat as manpager
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# fzf integration and keybinds
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# History Impromevements
setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_DUPS
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# Enabling X11 forwarding
export XAUTHORITY=$HOME/.Xauthority

# NodeJS stuff
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# References
# Classic oh-my-zsh prompt: https://stackoverflow.com/questions/68168011/how-to-alter-the-configuration-of-robbyrussel-theme-in-oh-my-zsh-so-that-the-arr
# Basic Color References: https://stackoverflow.com/questions/689765/how-can-i-change-the-color-of-my-prompt-in-zsh-different-from-normal-text
# Prompt values: https://superuser.com/questions/49092/how-to-format-the-path-in-a-zsh-prompt
# Configuring Zsh without Dependencies: https://thevaluable.dev/zsh-install-configure-mouseless/
