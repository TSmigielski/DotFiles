# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Prompt theme
source ~/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true # disable p9k

# Syntax highlighting
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Auto-suggestion
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"
ZSH_AUTOSUGGEST_STRATEGY=(history match_prev_cmd completion)

# Auto-complete
autoload -Uz compinit; compinit
zstyle ":completion:*" matcher-list "m:{a-zA-Z}={A-Za-z}" "r:|=*" "l:|=* r:|=*"
zstyle ":completion:*" menu select
_comp_options+=(globdots)

# Vim stuff
bindkey -v # Needs to be before any other keybind change
zmodload zsh/complist
bindkey -M menuselect "h" vi-backward-char
bindkey -M menuselect "k" vi-up-line-or-history
bindkey -M menuselect "l" vi-forward-char
bindkey -M menuselect "j" vi-down-line-or-history
bindkey -a "^[[3~" delete-char
bindkey "^[[3~" delete-char
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# Ctrl navigation
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^[[3;5~" kill-word
bindkey "^H" backward-kill-word

# Alt navigation
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word
bindkey "^[[3;3~" kill-word
bindkey "^[^?" backward-kill-word

# Home/End
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
autoload -U history-search-end
#zle -N history-beginning-search-backward-end history-search-end
#zle -N history-beginning-search-forward-end history-search-end
#bindkey "^[[A" history-beginning-search-backward-end
#bindkey "^[[B" history-beginning-search-forward-end
bindkey "^R" history-incremental-search-backward

# Misc
setopt auto_cd
WORDCHARS=

# NVM
if [[ -r /usr/share/nvm/init-nvm.sh ]]; then
  source /usr/share/nvm/init-nvm.sh
fi

# Env
export PATH=$PATH:~/.local/bin:~/.cargo/bin
export EDITOR=nvim
export VISUAL=nvim
export MANPAGER="nvim +Man!"
export KEYTIMEOUT=1
export TERM=xterm-256color
export DOTNET_CLI_UI_LANGUAGE=en
export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock

### Aliases ###
# Git
source ~/.zsh/omz.lib.git.zsh
source ~/.zsh/omz.git.plugin.zsh
alias gf="gfa"

# General
alias sudo="sudo "
alias vim="nvim"
alias so="source"
alias h="history"
alias ph="grep -i installed /var/log/pacman.log" # pacman history
alias bc="bc -q"
alias cal="cal -w3"
alias dunst-restart="killall dunst; notify-send 'dunst restarted'"
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Eza
alias eza="eza --git"
alias ls="eza --icons"
alias l="eza -laF"
alias ll="eza -laFG"

# Other
alias nightlight="redshift -x && redshift -O $1"
alias cmatrix="cmatrix -abu6"
alias waybar="killall waybar; waybar"


### Local file
if [[ -r ~/.config/zsh_local ]]; then
  source ~/.config/zsh_local
fi
