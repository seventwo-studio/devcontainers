#!/bin/bash
# Install development tools for macOS runner
# Mirrors the Linux runner toolset where applicable

set -euo pipefail

# Ensure brew is on PATH
if [[ -f /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -f /usr/local/bin/brew ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
fi

echo "Installing development tools..."

# --- mise (polyglot runtime manager) ---
if ! command -v mise &>/dev/null; then
    echo "Installing mise..."
    curl https://mise.run | sh
fi

# Add mise to PATH for this script
export PATH="$HOME/.local/bin:$PATH"

# Configure mise
export MISE_AUTO_TRUST=true

# Install default runtimes via mise
mise use -g node@lts
mise use -g python@3
mise install

echo "Node.js: $(mise exec -- node --version)"
echo "Python: $(mise exec -- python --version)"

# --- Bun runtime ---
if ! command -v bun &>/dev/null; then
    echo "Installing Bun..."
    curl -fsSL https://bun.sh/install | bash
fi

# --- Modern CLI tools ---
brew install \
    bat \
    eza \
    fd \
    fzf \
    ripgrep \
    starship \
    zoxide

# --- Image processing (matching Linux runner) ---
brew install \
    imagemagick \
    libheif \
    libraw \
    librsvg \
    libvips \
    webp

# --- macOS-specific tools ---
brew install \
    xcbeautify \
    xcodes

# --- Cleanup ---
brew cleanup --prune=all

echo "Development tools installation complete."
