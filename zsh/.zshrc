# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/exa"
plug "wintermi/zsh-starship"
plug "Aloxaf/fzf-tab"
plug "zsh-users/zsh-syntax-highlighting"

# Load and initialise completion system
autoload -Uz compinit
compinit

# Starship config
export STARSHIP_CONFIG="$HOME/.config/starship.toml"

# tmux alias
work() { tmux new-session -A -s ${1:-work}; }
