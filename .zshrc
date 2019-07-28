export PATH=$HOME/bin:/usr/local/bin:$HOME/.Scripts/:$PATH

export KEYTIMEOUT=1
export ZSH="$HOME/.oh-my-zsh"
export EDITOR=nvim

bindkey -a "^R" redo
bindkey "^s" history-incremental-search-backward

ZSH_THEME="som"

autoload -U compinit && compinit
plugins=(
  git
  zsh-syntax-highlighting
  zsh-completions
  vi-mode
  history-substring-search
)

source $ZSH/oh-my-zsh.sh
source $HOME/.aliases
