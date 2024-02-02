# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _correct _approximate
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' '+m:{[:lower:]}={[:upper:]} m:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+r:|[._-]=** r:|=**' '+l:|=* r:|=*'
zstyle ':completion:*' menu select=1
zstyle ':completion:*' original true
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/home/severin/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob notify
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install

bindkey ";5C" forward-word
bindkey ";5D" backward-word
bindkey ";3C" forward-word
bindkey ";3D" backward-word
bindkey ";3~" delete-word

export EDITOR=nvim
export AUR=https://aur.archlinux.org
export QT_QPA_PLATFORMTHEME=qt5ct
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

source ~/.zsh_aliases

eval 'ssh-agent' &> /dev/null

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

term=$(tty | grep tty)
if [[ $term != '' ]]
then
    Hyprland
fi
