#!/usr/bin/env zsh

echo "\n<<< Starting Homebrew Setup >>>\n"

# Install Homebrew
if exists brew; then
    echo "brew exists, skipping install"
else
    echo "brew doesn't exist, continue with install"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Install Rosetta
if [ -d "/usr/libexec/rosetta" ]; then
    echo "Rosetta already exists, skipping install"
else
    echo "Rosetta not installed. Installing ..."
    sudo softwareupdate --install-rosetta
fi

# Install taps/casks
brew bundle --verbose

# Set Brave as the default browser
echo "Setting Brave as the default browser, please confirm.
open -a "Brave Browser" --args --make-default-browser
