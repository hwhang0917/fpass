#!/usr/bin/env bash

set -e

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# URL and destination
FPASS_URL="https://raw.githubusercontent.com/hwhang0917/fpass/refs/heads/main/fpass"
INSTALL_DIR="$HOME/.local/bin"
FPASS_BIN="$INSTALL_DIR/fpass"

echo "Installing fpass..."

# Create directory if it doesn't exist
mkdir -p "$INSTALL_DIR"

# Download the script
echo "Downloading fpass from $FPASS_URL..."
if command -v curl &> /dev/null; then
    curl -fsSL "$FPASS_URL" -o "$FPASS_BIN"
elif command -v wget &> /dev/null; then
    wget -q "$FPASS_URL" -O "$FPASS_BIN"
else
    echo "Error: Neither curl nor wget found. Please install one of them."
    exit 1
fi

# Make it executable
chmod +x "$FPASS_BIN"

echo -e "${GREEN}Successfully installed fpass to $FPASS_BIN${NC}"
echo ""

# Check if ~/.local/bin is in PATH
if [[ ":$PATH:" != *":$INSTALL_DIR:"* ]]; then
    echo -e "${YELLOW}NOTE: $INSTALL_DIR is not in your PATH${NC}"
    echo "Add the following line to your shell configuration file:"
    echo ""

    # Detect shell and suggest appropriate config file
    if [[ -n "$BASH_VERSION" ]]; then
        echo "  echo 'export PATH=\"\$HOME/.local/bin:\$PATH\"' >> ~/.bashrc"
        echo "  source ~/.bashrc"
    elif [[ -n "$ZSH_VERSION" ]]; then
        echo "  echo 'export PATH=\"\$HOME/.local/bin:\$PATH\"' >> ~/.zshrc"
        echo "  source ~/.zshrc"
    else
        echo "  export PATH=\"\$HOME/.local/bin:\$PATH\""
        echo ""
        echo "  (Add this to your shell's configuration file)"
    fi
    echo ""
else
    echo -e "${GREEN}$INSTALL_DIR is already in your PATH${NC}"
    echo "You can now use 'fpass' command"
fi
