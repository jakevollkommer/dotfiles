#!/usr/bin/env zsh

echo "\n<<< Starting iTerm2 Setup >>>\n"

echo "Setting preferences directory"
# Specify the preferences directory
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/.dotfiles/iterm2"
# Tell iTerm2 to use the custom preferences in the directory
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

# Set the animation of dedicated windows to be really fast
defaults write com.googlecode.iterm2 HotkeyTermAnimationDuration -float 0.01
