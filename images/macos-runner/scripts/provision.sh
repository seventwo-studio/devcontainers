#!/bin/bash
# Main provisioning script for macOS runner image
# Orchestrates all setup steps for Apple Virtualization-based GitHub Actions runner

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "=== SevenTwo macOS Runner Provisioning ==="
echo "macOS version: $(sw_vers -productVersion)"
echo "Architecture: $(uname -m)"
echo ""

# Step 1: Homebrew and core packages
echo ">>> Step 1/4: Setting up Homebrew and core packages..."
"$SCRIPT_DIR/setup-homebrew.sh"

# Step 2: Development tools
echo ">>> Step 2/4: Installing development tools..."
"$SCRIPT_DIR/setup-tools.sh"

# Step 3: GitHub Actions runner
echo ">>> Step 3/4: Setting up GitHub Actions runner..."
"$SCRIPT_DIR/setup-runner.sh"

# Step 4: Shell configuration
echo ">>> Step 4/4: Configuring shell environment..."
"$SCRIPT_DIR/setup-shell.sh"

echo ""
echo "=== macOS Runner provisioning complete ==="
