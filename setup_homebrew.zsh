#!/usr/bin/env zsh

echo "\n<<< Starting Homebrew Setup >>>\n"

# Install Homebrew
if exists brew; then
    echo "brew exists, skipping install"
else
    echo "brew doesn't exist, continue with install"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install taps/casks
brew bundle --verbose
