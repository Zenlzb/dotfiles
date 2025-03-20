brewprefix=/opt/homebrew
export PATH="$brewprefix/bin:$brewprefix/sbin:$PATH"
export MANPATH="$brewprefix/share/man:$MANPATH"
unset brewprefix

export PATH=$HOME/bin:/usr/local/bin:$PATH

# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-history-substring-search"
plug "zap-zsh/completions"
plug "zap-zsh/supercharge"
plug "zap-zsh/exa"
plug "wintermi/zsh-starship"
plug "Aloxaf/fzf-tab"
plug "zsh-users/zsh-syntax-highlighting"

# Load and initialise completion system
autoload -Uz compinit
compinit

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Starship config
export STARSHIP_CONFIG="$HOME/.config/starship.toml"

# tmux alias
main() { tmx2 new-session -A -s ${1:-main}; }

# roadwarrior alias
alias ct="rw zenlee.c.googlers.com"



export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
