eval "$(starship init zsh)"

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

autoload -U compinit && compinit
fpath+=~/.zfunc

zinit cdreplay -q

bindkey -e

HISTSIZE=5000
HISTFILE=~/.histfile
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

source ~/.aliases

export EDITOR=nvim
export AUR=https://aur.archlinux.org
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

function ya() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

eval 'ssh-agent' &> /dev/null
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

term=$(tty | grep tty)
if [[ $term != '' ]]
then
    if [ -e /home/severin/.local/share/.select_session ]
    then
        rm /home/severin/.local/share/.select_session
        eval "$(grep Exec /usr/share/wayland-sessions/* | cut -d "=" -f 2 | fzf --layout=reverse-list -0 -1)"
    else
        Hyprland &> /dev/null
    fi
fi
