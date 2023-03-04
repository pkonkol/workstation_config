# Template for .zshrc
# Custom $PATH
export PATH="$HOME/bin:$HOME/.local/bin:$PATH:/home/user/.cargo/bin:/home/user/go/bin"
umask 022

export EDITOR=vim
export VISUAL=vim
export PAGER=less
export TERMINAL=Alacritty
export QT_QPA_PLATFORMTHEME=gtk2

setopt no_beep
setopt auto_pushd
setopt notify
setopt nohup

eval `dircolors ~/.config/dircolors.moonshine`

alias ls='ls --color=auto'
alias less='less -R'
alias watch='watch --color'
alias grep='grep --color=auto'
alias _='sudo'

export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=10000
export SAVEHIST=${HISTSIZE}
export HISTIGNORE="ls:ll:cd:cd -:pwd:exit:date:* --help"
setopt inc_append_history
setopt hist_expire_dups_first
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt share_history
setopt auto_cd
CACHEDIR="$HOME/.zsh/cache"
# create $CACHEDIR if it does not exist
if [ ! -d $CACHEDIR ]; then
  mkdir -p $CACHEDIR
fi

source /usr/share/zsh/share/antigen.zsh
antigen bundle "zsh-users/zsh-completions"
antigen bundle "zsh-users/zsh-autosuggestions"
antigen bundle "zsh-users/zsh-history-substring-search"
antigen bundle "zsh-users/zsh-syntax-highlighting"
antigen bundle "jeffreytse/zsh-vi-mode"

antigen theme jackharrisonsherlock/common

antigen apply


ZSH_AUTOSUGGEST_USE_ASYNC=True
ZSH_AUTOSUGGEST_STRATEGY=(history completion match_prev_cmd)
bindkey '^ ' autosuggest-accept

HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=True
HISTORY_SUBSTRING_SEARCH_FUZZY=True
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets cursor)

export KEYTIMEOUT=1

autoload -U compinit
compinit -d $CACHEDIR/zcompdump
