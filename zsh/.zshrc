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

# dotfiles (GNU Stow) aliases
alias dotstow='(cd "$HOME/.dotfiles" && unsetopt globdots && stow -v -R */)'
dotcheck() {
  for pkg in "$HOME"/.dotfiles/*(/N); do
    [[ "${pkg:t}" == .* ]] && continue
    for src in "$pkg"/**/*(D.); do
      local rel="${src#$pkg/}"
      local dst="$HOME/$rel"
      if [[ -e "$dst" && "${dst:A}" == "${src:A}" ]]; then
        printf "✅ %-35s -> %s\n" "~/$rel" "${dst:A}"
      elif [[ -L "$dst" ]]; then
        printf "❌ %-35s (broken/wrong symlink -> %s)\n" "~/$rel" "$(readlink "$dst")"
      elif [[ -e "$dst" ]]; then
        printf "⚠️  %-35s (regular file, not symlinked)\n" "~/$rel"
      else
        printf "⭕ %-35s (not stowed)\n" "~/$rel"
      fi
    done
  done
}



export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Added by Jetski
export PATH="/Users/zenlee/.jetski/jetski/bin:$PATH"

