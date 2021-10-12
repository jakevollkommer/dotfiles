#!/usr/bin/env zsh

echo "\n<<< Starting Node Setup >>>\n"

# Node versions are manages with `n`, which is in the Brewfile
# See zshrc for N_PREFIX variables and addition to PATH

# Install Node
if exists node; then
    echo "Node $(node --version) && NPM $(npm --version) already installed"
else
    echo "Installing Node & NPM with n..."
    n latest
fi
