#### MY_CONFIG ################################################################
MY_CONFIG=$HOME/.config/my_config

#### PATH and FPATH ###########################################################
PATH=$HOME/bin:$(ruby -e 'print Gem.user_dir')/bin:$PATH
if type yarn 2>&1 >/dev/null
then
    PATH=$XDG_CONFIG_HOME/yarn/global/node_modules/.bin:$PATH
fi

#### ZSH CONFIG ###############################################################
# zsh history
HISTFILE=~/.zsh_history
SAVEHIST=5000
HISTSIZE=5000
setopt inc_append_history
setopt share_history
setopt hist_ignore_dups

# better autocomplete
autoload -U compinit && compinit

# autocomplete menu
zstyle ':completion:*' menu select

# prompt color
autoload -U colors && colors

# vim mode
bindkey -v

# vim bindings
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

#### LOAD SUB FILE ############################################################
# Load aliases
source "$MY_CONFIG/aliases"

# Load prompt
source "$MY_CONFIG/prompt"

# Load fzf config
source "$MY_CONFIG/fzf"

#### GLOBAL ###################################################################
# default editor
export EDITOR=vim

# Couleurs pour le man
man()
{
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
        man "$@"
}

# ssh-agent socket
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

back()
{
    mv "$1" "$1"_back
}

#### GO #######################################################################
export GOPATH=$HOME/test/go
PATH=$PATH:$GOPATH/bin

# vim: filetype=sh tabstop=4 shiftwidth=4 expandtab
