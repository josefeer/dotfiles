prompt_git_status() {
  local INDEX STATUS

  INDEX=$(command git status --porcelain -b 2> /dev/null)

  STATUS=""

  if $(echo "$INDEX" | grep '^ M ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED$STATUS"
  elif $(echo "$INDEX" | grep '^AM ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED$STATUS"
  elif $(echo "$INDEX" | grep '^MM ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED$STATUS"
  elif $(echo "$INDEX" | grep '^ T ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED$STATUS"
  fi


  if $(echo "$INDEX" | grep '^## [^ ]\+ .*ahead' &> /dev/null); then
    STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_AHEAD"
  fi


  if $(echo "$INDEX" | grep '^## [^ ]\+ .*behind' &> /dev/null); then
    STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_BEHIND"
  fi


  if [[ ! -z "$STATUS" ]]; then
    echo "$STATUS "
  fi
}

prompt_git_branch() {
    autoload -Uz vcs_info
    precmd_vcs_info() { vcs_info }
    precmd_functions+=( precmd_vcs_info )
    setopt prompt_subst
    zstyle ':vcs_info:git:*' formats '%b'
}

prompt_git_info() {
    branch_color="yellow"
    if [[ "$vcs_info_msg_0_" = "main" || "$vcs_info_msg_0_" = "master" ]]; then
      branch_color="red"
    fi

    [ ! -z "$vcs_info_msg_0_" ] && echo "$ZSH_THEME_GIT_PROMPT_PREFIX%F{$branch_color}$vcs_info_msg_0_%f$ZSH_THEME_GIT_PROMPT_SUFFIX "
}

prompt_git_setup() {
    autoload -Uz add-zsh-hook

    ZSH_THEME_GIT_PROMPT_PREFIX="%F{blue}git:("
    ZSH_THEME_GIT_PROMPT_SUFFIX="%F{blue})%f"

    ZSH_THEME_GIT_PROMPT_MODIFIED="%F{yellow}✗%f"
    ZSH_THEME_GIT_PROMPT_BEHIND="%F{red}%f"
    ZSH_THEME_GIT_PROMPT_AHEAD="%F{green}%f"

    prompt_git_branch
}
