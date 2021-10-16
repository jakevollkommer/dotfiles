#!/usr/bin/env zsh

echo "\n<<< Starting Python Setup >>>\n"

# Python versions are manages with `pyenv`, which is in the Brewfile
# See zshrc for N_PREFIX variables and addition to PATH

# Install Python
echo "Installing Python and Python3 with pyenv..."

# Latest version of Python 2
latest2=$(pyenv install --list | grep " 2." | sed 's/^  //' | grep '^\d' | grep --invert-match 'dev\|a\|b' | tail -1)
# Latest version of Python 3
latest3=$(pyenv install --list | sed 's/^  //' | grep '^\d' | grep --invert-match 'dev\|a\|b' | tail -1)

# Install python 2
if pyenv versions | grep $latest2 1>/dev/null; then
    echo "Python $latest2 already installed."
else
    echo "Installing Python $latest2"
    pyenv install $latest2
fi

# Install python 3
if pyenv versions | grep $latest3 1>/dev/null; then
    echo "yo"
    echo "Python $latest3 already installed."
else
    echo "hey"
    echo "Installing Python $latest3"
    pyenv install $latest3
fi

echo "Setting python3 as default python"
pyenv global $latest3

pyenv versions
