#!/bin/bash
# Configure shell environment for macOS runner
# macOS defaults to zsh

set -euo pipefail

echo "Configuring shell environment..."

# Determine Homebrew prefix
if [[ -f /opt/homebrew/bin/brew ]]; then
    BREW_PREFIX="/opt/homebrew"
else
    BREW_PREFIX="/usr/local"
fi

# --- .zshrc ---
cat > "$HOME/.zshrc" << EOF
# SevenTwo macOS Runner - zsh configuration

# Homebrew
eval "\$($BREW_PREFIX/bin/brew shellenv)"

# Simple prompt (overridden by starship below)
PROMPT="> "

# Aliases
alias ll="ls -la"
alias la="ls -A"
alias l="ls -CF"

# Modern CLI aliases (if available)
command -v eza &>/dev/null && alias ls="eza" && alias ll="eza -la" && alias la="eza -a" && alias l="eza -F"
command -v bat &>/dev/null && alias cat="bat --paging=never"

# Zsh settings
setopt AUTO_CD
setopt HIST_VERIFY
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# mise-en-place
export MISE_AUTO_TRUST="true"
if command -v mise &>/dev/null; then
    eval "\$(mise activate zsh)"
fi

# zoxide
command -v zoxide &>/dev/null && eval "\$(zoxide init zsh)"

# fzf
[ -f "\$BREW_PREFIX/opt/fzf/shell/key-bindings.zsh" ] && source "\$BREW_PREFIX/opt/fzf/shell/key-bindings.zsh"
[ -f "\$BREW_PREFIX/opt/fzf/shell/completion.zsh" ] && source "\$BREW_PREFIX/opt/fzf/shell/completion.zsh"

# Starship prompt (load last)
command -v starship &>/dev/null && eval "\$(starship init zsh)"
EOF

# --- .zshenv (PATH for non-interactive shells, e.g. GitHub Actions) ---
cat > "$HOME/.zshenv" << EOF
# PATH configuration for non-interactive shells
export PATH="\$HOME/.local/share/mise/shims:\$HOME/.local/bin:\$HOME/.bun/bin:$BREW_PREFIX/bin:$BREW_PREFIX/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export MISE_AUTO_TRUST="true"
EOF

# --- .zprofile (login shell) ---
cat > "$HOME/.zprofile" << EOF
# Homebrew (login shell)
eval "\$($BREW_PREFIX/bin/brew shellenv)"
EOF

# --- .bash_profile (for scripts that use bash) ---
cat > "$HOME/.bash_profile" << EOF
# Homebrew
eval "\$($BREW_PREFIX/bin/brew shellenv)"

# mise
export MISE_AUTO_TRUST="true"
export PATH="\$HOME/.local/share/mise/shims:\$HOME/.local/bin:\$HOME/.bun/bin:\$PATH"
if command -v mise &>/dev/null; then
    eval "\$(mise activate bash)"
fi
EOF

echo "Shell configuration complete."
