#!/usr/bin/env zsh

echo "\n<<< Starting ZSH Setup >>>\n"

# Install Homebrew

# Add brew version of zsh to default shells
if grep -Fzq "usr/local/bin/zsh" "/etc/shells"; then
    echo "usr/local/bin/zsh already exists in /etc/shells"
else
    echo "Enter superuser (sudo) password to edit /etc/shells"
    echo "/usr/local/bin/zsh" | sudo tee -a "/etc/shells" >/dev/null
fi

if ["$SHELL" = "usr/local/bin/zsh"]; then
    echo "$SHELL is already /usr/local/bin/zsh"
else
    # Change the login shell
    echo "Enter superuser (sudo) password to change login shell"
    chsh -s "/usr/local/bin/zsh"
fi
