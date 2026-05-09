# macOS Runner Image

A macOS virtual machine image for GitHub Actions self-hosted runners, built for [Apple Virtualization framework](https://developer.apple.com/documentation/virtualization) via [Tart](https://tart.run).

## Overview

This image provides a fully provisioned macOS runner with development tools, runtime managers, and the GitHub Actions runner agent pre-installed. It's designed to run on Apple Silicon Macs using Tart, which leverages Apple's native Virtualization framework for near-native performance.

## Prerequisites

- Apple Silicon Mac (M1/M2/M3/M4)
- [Tart](https://tart.run) (`brew install cirruslabs/cli/tart`)
- [Packer](https://www.packer.io/) with the [tart plugin](https://github.com/cirruslabs/packer-plugin-tart) (for building images)

## Quick Start

### Using a Pre-built Image

```bash
# Pull the image from the registry
tart pull ghcr.io/seventwo-studio/macos-runner:latest

# Clone a local VM from the image
tart clone ghcr.io/seventwo-studio/macos-runner:latest my-runner

# Run the VM
tart run my-runner

# SSH into the VM (default credentials: admin/admin)
ssh admin@$(tart ip my-runner)

# Configure the GitHub Actions runner
./configure-runner.sh --url https://github.com/<org>/<repo> --token <TOKEN>

# Start the runner
./start-runner.sh
```

### Building the Image

```bash
cd images/macos-runner

# Initialize Packer plugins
packer init macos-runner.pkr.hcl

# Build with default settings (macOS Sequoia + Xcode)
packer build macos-runner.pkr.hcl

# Build from a vanilla macOS base (no Xcode)
packer build -var 'tart_base_image=ghcr.io/cirruslabs/macos-sequoia-vanilla:latest' macos-runner.pkr.hcl

# Build with custom disk size
packer build -var 'disk_size=150' macos-runner.pkr.hcl
```

## What's Included

### Core Tools
- **Homebrew** — macOS package manager
- **mise** — polyglot runtime manager (Node.js LTS, Python 3)
- **Bun** — fast JavaScript runtime
- **GitHub CLI** (`gh`)
- **Git** + Git LFS

### Build & CI Tools
- autoconf, automake, cmake, make, pkg-config
- GnuPG, OpenSSL
- shellcheck, jq, yq
- p7zip, zip/unzip, rsync

### Modern CLI
- bat, eza, fd, fzf, ripgrep
- starship prompt, zoxide

### Image Processing
- ImageMagick, libvips, libheif, libraw, librsvg, webp

### macOS-Specific
- **Xcode** (when using xcode base image)
- **xcbeautify** — Xcode build log formatter
- **xcodes** — Xcode version manager

### GitHub Actions Runner
- Latest runner agent pre-installed at `~/actions-runner`
- Convenience scripts: `~/configure-runner.sh`, `~/start-runner.sh`

## VM Configuration

| Setting | Default |
|---------|---------|
| CPU cores | 4 |
| Memory | 8 GB |
| Disk | 100 GB |
| SSH user | `admin` |
| SSH password | `admin` |

Override these in the Packer template or when cloning with Tart:

```bash
# Clone with custom resources
tart clone ghcr.io/seventwo-studio/macos-runner:latest my-runner
tart set my-runner --cpu 8 --memory 16384
```

## Orchestration

For running multiple macOS runners, use [Orchard](https://github.com/cirruslabs/orchard) (cluster orchestrator for Tart VMs) or integrate with your existing CI/CD infrastructure.

### Example: Systemd-style Launch Agent

```bash
# On the host Mac, create a launch agent to auto-start the runner
cat > ~/Library/LaunchAgents/com.seventwo.runner.plist << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.seventwo.runner</string>
    <key>ProgramArguments</key>
    <array>
        <string>/opt/homebrew/bin/tart</string>
        <string>run</string>
        <string>my-runner</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
    <key>KeepAlive</key>
    <true/>
</dict>
</plist>
EOF

launchctl load ~/Library/LaunchAgents/com.seventwo.runner.plist
```

## Default Credentials

| User | Password |
|------|----------|
| admin | admin |

> Change the password after first boot for production use.
