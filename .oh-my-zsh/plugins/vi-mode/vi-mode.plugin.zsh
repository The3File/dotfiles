# Updates editor information when the keymap changes.
function zle-keymap-select() {
  zle reset-prompt
  zle -R
}

# Ensure that the prompt is redrawn when the terminal size changes.
TRAPWINCH() {
  zle && { zle -R; zle reset-prompt }
}

zle -N zle-keymap-select
zle -N edit-command-line


bindkey -v

# allow v to edit the command line (standard behaviour)
autoload -Uz edit-command-line
bindkey -M vicmd 'v' edit-command-line

# allow ctrl-p, ctrl-n for navigate history (standard behaviour)
bindkey '^P' up-history
bindkey '^N' down-history

# allow ctrl-h, ctrl-w, ctrl-? for char and word deletion (standard behaviour)
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word

# allow ctrl-a and ctrl-e to move to beginning/end of line
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line

##if mode indicator wasn't setup by theme, define default
#function zle-line-init zle-keymap-select {
#    RPS1="${${KEYMAP/vicmd/}/(main|viins)/INSERT}"
#    RPS2=$RPS3
#    zle reset-prompt
#}

#zle-keymap-select () {
#  case $KEYMAP in
#    vicmd) print -rn -- $terminfo[cvvis];; # block cursor
#    viins|main) print -rn -- $terminfo[cnorm];; # less visible cursor
#  esac
#}

#function vi_mode_prompt_info() {
#  echo "${${KEYMAP/vicmd/$MODE_INDICATOR}/(main|viins)/}"
#}

# define right prompt, if it wasn't defined by a theme
if [[ "$RPS2" == "" && "$RPROMPT" == "" ]]; then
  RPS1='$(vi_mode_prompt_info)'
fi
