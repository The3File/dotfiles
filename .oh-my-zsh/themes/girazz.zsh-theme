# ZSH Theme - Preview: http://dl.dropbox.com/u/4109351/pics/gnzh-zsh-theme.png
# Based on bira theme

# load some modules
autoload -U colors zsh/terminfo # Used in the colour alias below
colors
setopt prompt_subst

# make some aliases for the colours: (coud use normal escap.seq's too)
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
  eval PR_$color='%{$fg[${(L)color}]%}'
done
eval PR_NO_COLOR="%{$terminfo[sgr0]%}"
eval PR_BOLD="%{$terminfo[bold]%}"

# Check the UID
if [[ $UID -eq 0 ]]; then # root
  eval PR_USER='${PR_RED}%n${PR_NO_COLOR}'
  eval PR_USER_OP='${PR_RED}%#${PR_NO_COLOR}'
  local PR_PROMPT='$PR_RED➤ $PR_NO_COLOR'
else
  eval PR_USER='${PR_GREEN}%n${PR_NO_COLOR}'
  eval PR_USER_OP='${PR_GREEN}%#${PR_NO_COLOR}'
  local PR_PROMPT='$PR_NO_COLOR➤ $PR_NO_COLOR'
fi

# Check if we are on SSH or not
if [[ -n "$SSH_CLIENT"  ||  -n "$SSH2_CLIENT" ]]; then
  eval PR_HOST='${PR_YELLOW}%M${PR_NO_COLOR}' #SSH
else
  eval PR_HOST='${PR_GREEN}%M${PR_NO_COLOR}' # no SSH
fi

local return_code="%(?..%{$PR_RED%}%? ↵%{$PR_NO_COLOR%})"

local current_time='${PR_NO_COLOR}[${PR_CYAN}%*${PR_NO_COLOR}]'
local user_host='${PR_USER}${PR_CYAN}@${PR_HOST}'
local current_dir='%{$PR_BOLD$PR_BLUE%}%~%{$PR_NO_COLOR%}'
local rvm_ruby=''
if which rvm-prompt &> /dev/null; then
  rvm_ruby='%{$PR_RED%}‹$(rvm-prompt i v g s)›%{$PR_NO_COLOR%}'
else
  if which rbenv &> /dev/null; then
  rvm_ruby='%{$PR_RED%}‹$(rbenv version | sed -e "s/ (set.*$//")›%{$PR_NO_COLOR%}'
  fi
fi

# Simplified function to be used in Windows since git is so slow in WSL
function windows_git_prompt_info() {
  if which git &> /dev/null; then
    local g="$(git rev-parse --git-dir 2>/dev/null)"
    if [[ -n "$g" ]]; then
      local r
      local b
      if [ -d "$g/rebase-apply" ]; then
        if test -f "$g/rebase-apply/rebasing"; then
          r="|rebase"
        elif test -f "$g/rebase-apply/applying"; then
          r="|am"
        else
          r="|am/rebase"
        fi
        b="$(git symbolic-ref HEAD 2>/dev/null)"
      elif [ -f "$g/rebase-merge/interactive" ]; then
        r="|rebase-i"
        b="$(cat "$g/rebase-merge/head-name")"
      elif [ -d "$g/rebase-merge" ]; then
        r="|rebase-m"
        b="$(cat "$g/rebase-merge/head-name")"
      elif [ -f "$g/MERGE_HEAD" ]; then
        r="|merging"
        b="$(git symbolic-ref HEAD 2>/dev/null)"
      else
        if [ -f "$g/BISECT_LOG" ]; then
          r="|bisecting"
        fi
        b="$(cut -f2 -d" " "$g/HEAD")"
        if [[ "${b##refs/heads/}" == "${b}" ]]; then
          if ! b="$(git symbolic-ref HEAD 2>/dev/null)"; then
            if ! b="$(git describe --exact-match HEAD 2>/dev/null)"; then
              b="$(cut -c1-7 "$g/HEAD")..."
            fi
          fi
        fi
      fi
      echo `printf "%s" "${PR_CYAN}<${PR_GREEN}${b##refs/heads/}$r${PR_CYAN}>${PR_NO_COLOR}"`
    fi
  fi
}

local git_prompt
if [[ $(uname -a | grep -iq -e 'windows' -e 'microsoft') -eq 0 ]]; then
  git_prompt='$(windows_git_prompt_info)'
else
  git_prompt='$(git_prompt_info)'
fi

PROMPT="╭─${current_time} ${user_host} ${current_dir} ${rvm_ruby} ${git_prompt}%{$PR_NO_COLOR%}
╰─$PR_PROMPT "
RPS1='$(vi_mode_prompt_info) '"${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$PR_YELLOW%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$PR_NO_COLOR%}"
