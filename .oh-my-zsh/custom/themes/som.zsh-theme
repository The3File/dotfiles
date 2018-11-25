function prompt_char {
	if [ $UID -eq 0 ]; then echo "#"; fi
}

vi_mode_indicator() {
  case $KEYMAP in
    vicmd) print -n '#' ;;
    *) print -n '$' ;;
  esac
}


PROMPT='%(!.%{$fg_bold[red]%}.%{$fg_bold[green]%}%n@)%m %{$fg_bold[blue]%}%(!.%1~.%~) $(git_prompt_info)%_$(vi_mode_indicator)%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=") "
