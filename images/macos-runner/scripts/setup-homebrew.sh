#!/bin/bash
# Install Homebrew and core packages for macOS runner

set -euo pipefail

# Install Homebrew if not present
if ! command -v brew &>/dev/null; then
    echo "Installing Homebrew..."
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Ensure brew is on PATH for Apple Silicon
if [[ -f /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -f /usr/local/bin/brew ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
fi

echo "Homebrew version: $(brew --version | head -1)"

# Disable analytics
brew analytics off

# Update and upgrade
brew update

# Core build tools and utilities (mirrors Linux runner where applicable)
brew install \
    autoconf \
    automake \
    bison \
    cmake \
    coreutils \
    curl \
    findutils \
    flex \
    gawk \
    gh \
    git \
    git-lfs \
    gnu-sed \
    gnu-tar \
    gnupg \
    grep \
    jq \
    libtool \
    make \
    openssl \
    p7zip \
    pkg-config \
    rsync \
    shellcheck \
    tree \
    unzip \
    wget \
    xz \
    yq \
    zip \
    zstd

# Initialize git-lfs
git lfs install

# Cleanup
brew cleanup --prune=all

echo "Homebrew setup complete."
