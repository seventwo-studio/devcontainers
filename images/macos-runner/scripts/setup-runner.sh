#!/bin/bash
# Setup GitHub Actions runner for macOS
# Downloads and configures the latest runner release

set -euo pipefail

RUNNER_HOME="$HOME/actions-runner"

echo "Setting up GitHub Actions runner..."

# Determine architecture
ARCH="$(uname -m)"
case "$ARCH" in
    arm64) RUNNER_ARCH="arm64" ;;
    x86_64) RUNNER_ARCH="x64" ;;
    *) echo "Unsupported architecture: $ARCH"; exit 1 ;;
esac

# Fetch latest runner version
RUNNER_VERSION=$(curl -fsSL https://api.github.com/repos/actions/runner/releases/latest | jq -r '.tag_name' | sed 's/^v//')
echo "Latest runner version: $RUNNER_VERSION"

# Create runner directory
mkdir -p "$RUNNER_HOME"
cd "$RUNNER_HOME"

# Download and extract runner
RUNNER_URL="https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-osx-${RUNNER_ARCH}-${RUNNER_VERSION}.tar.gz"
echo "Downloading runner from: $RUNNER_URL"
curl -fL -o runner.tar.gz "$RUNNER_URL"
tar xzf runner.tar.gz
rm runner.tar.gz

echo "GitHub Actions runner v${RUNNER_VERSION} installed at $RUNNER_HOME"

# Create a convenience script to configure and start the runner
cat > "$HOME/configure-runner.sh" << 'SCRIPT'
#!/bin/bash
# Configure and start the GitHub Actions runner
# Usage: ./configure-runner.sh --url <repo-or-org-url> --token <registration-token>
set -euo pipefail

RUNNER_HOME="$HOME/actions-runner"
cd "$RUNNER_HOME"

# Pass all arguments to the runner config script
./config.sh "$@"
SCRIPT
chmod +x "$HOME/configure-runner.sh"

cat > "$HOME/start-runner.sh" << 'SCRIPT'
#!/bin/bash
# Start the GitHub Actions runner
set -euo pipefail

RUNNER_HOME="$HOME/actions-runner"
cd "$RUNNER_HOME"

./run.sh
SCRIPT
chmod +x "$HOME/start-runner.sh"

echo "Runner setup complete. Use ~/configure-runner.sh and ~/start-runner.sh to manage the runner."
