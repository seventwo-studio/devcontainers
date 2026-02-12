#!/bin/bash
set -e

echo "=========================================="
echo "Runner Image Integration Tests"
echo "=========================================="
echo ""

# Test 1: Mise Installation and Tool Management
echo "Test 1: Testing mise installation and tool management"
echo "--------------------------------------------------"

# Check if mise is available (should be from base image)
if command -v mise &> /dev/null; then
    echo "✓ mise is available"
    mise --version
else
    echo "✗ mise not found - this is expected as it's not in the runner image"
    echo "  Installing mise for testing..."
    curl https://mise.run | sh
    export PATH="$HOME/.local/bin:$PATH"
fi

# Install tools using mise
echo ""
echo "Installing Node.js and Python via mise..."
mise install

# Verify tools are installed
echo ""
echo "Verifying mise-installed tools:"
mise exec -- node --version
mise exec -- npm --version
mise exec -- python --version

echo "✓ mise successfully installed and managed tools"
echo ""

# Test 2: Playwright Browser Testing
echo "Test 2: Testing Playwright with pre-installed browsers"
echo "-------------------------------------------------------"

# Verify environment variables
echo "Checking Playwright environment variables:"
echo "  PLAYWRIGHT_BROWSERS_PATH=$PLAYWRIGHT_BROWSERS_PATH"

if [ "$PLAYWRIGHT_BROWSERS_PATH" != "/usr/local/share/ms-playwright" ]; then
    echo "✗ PLAYWRIGHT_BROWSERS_PATH not set correctly"
    exit 1
fi

echo "✓ Playwright environment variables are correct"
echo ""

# Verify browsers are available
echo "Checking for pre-installed browsers:"
if [ -d "/usr/local/share/ms-playwright" ]; then
    echo "✓ Browser directory exists"
    ls -la /usr/local/share/ms-playwright/

    # Check for specific browsers
    for browser in chromium firefox webkit; do
        if ls /usr/local/share/ms-playwright/${browser}* 1> /dev/null 2>&1; then
            echo "  ✓ $browser found"
        else
            echo "  ✗ $browser not found"
            exit 1
        fi
    done
else
    echo "✗ Browser directory not found"
    exit 1
fi

echo ""
echo "Installing Playwright npm package..."
mise exec -- npm install --no-save

echo ""
echo "Running Playwright tests..."
mise exec -- npm test

echo ""
echo "✓ Playwright tests completed successfully"
echo ""

# Test 3: Docker Availability
echo "Test 3: Testing Docker availability"
echo "------------------------------------"

if command -v docker &> /dev/null; then
    echo "✓ docker is available"
    docker --version

    # Check for buildx
    if docker buildx version &> /dev/null; then
        echo "✓ docker buildx is available"
        docker buildx version
    else
        echo "✗ docker buildx not found"
        exit 1
    fi
else
    echo "✗ docker not found"
    exit 1
fi

echo ""

# Test 4: Bun Runtime
echo "Test 4: Testing Bun runtime"
echo "---------------------------"

if command -v bun &> /dev/null; then
    echo "✓ bun is available"
    bun --version
else
    echo "✗ bun not found"
    exit 1
fi

echo ""

# Test 5: Basic Development Tools
echo "Test 5: Testing basic development tools"
echo "----------------------------------------"

tools=("git" "curl" "wget" "jq" "make" "gcc")
for tool in "${tools[@]}"; do
    if command -v "$tool" &> /dev/null; then
        echo "  ✓ $tool is available"
    else
        echo "  ✗ $tool not found"
        exit 1
    fi
done

echo ""

# Test 6: Image Processing Libraries
echo "Test 6: Testing image processing libraries"
echo "-------------------------------------------"

# Check vips (sharp dependency)
if command -v vips &> /dev/null; then
    echo "  ✓ vips is available ($(vips --version 2>&1 | head -1))"
else
    echo "  ✗ vips not found"
    exit 1
fi

# Check ImageMagick
if command -v convert &> /dev/null; then
    echo "  ✓ imagemagick is available"
else
    echo "  ✗ imagemagick not found"
    exit 1
fi

# Check git-lfs
if command -v git-lfs &> /dev/null; then
    echo "  ✓ git-lfs is available ($(git-lfs --version))"
else
    echo "  ✗ git-lfs not found"
    exit 1
fi

# Check libvips shared library is linkable
if pkg-config --exists vips 2>/dev/null; then
    echo "  ✓ libvips pkg-config: $(pkg-config --modversion vips)"
else
    echo "  ✗ libvips pkg-config not found"
    exit 1
fi

echo ""
echo "=========================================="
echo "All tests passed successfully! ✓"
echo "=========================================="
