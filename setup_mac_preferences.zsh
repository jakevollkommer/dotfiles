#!/usr/bin/env zsh

echo "\n<<< Starting Mac Preferences Setup >>>\n"

echo "Always show hidden files in Finder ..."
defaults write com.apple.finder AppleShowAllFiles -boolean true

echo "Always arrange files in Finder by name ..."
defaults write com.apple.Finder FXPreferredGroupBy name

echo "Never group files in Finder ..."
defaults write com.apple.finder FXPreferredGroupBy none

# Four-letter codes for the other view modes: `icnv`, `clmv`, `glyv`
echo "Using list view in all Finder windows by default ..."
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

echo "Disable the warning when changing file extensions ..."
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

echo "Show file extensions by default ..."
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

echo "Show ~/Library folder ..."
chflags nohidden ~/Library

echo "Disable the “Are you sure you want to open this application?” dialog ..."
defaults write com.apple.LaunchServices LSQuarantine -bool false

echo "Disables \"Scroll direction: natural\" in favor of old and correct style ..."
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

echo "Set a blazingly fast keyboard repeat rate ..."
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 15

echo "Automatically illuminate built-in MacBook keyboard in low light ..."
defaults write com.apple.BezelServices kDim -bool true

echo "Turn off keyboard illumination when computer is not used for 5 minutes ..."
defaults write com.apple.BezelServices kDimTime -int 300

echo "Require password immediately after sleep or screen saver begins ..."
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

echo "Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF) ..."
defaults write com.apple.screencapture type -string "png ..."

echo "Finder: show status bar ..."
defaults write com.apple.finder ShowStatusBar -bool true

echo "Use current directory as default search scope in Finder ..."
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

echo "Finder: allow text selection in Quick Look ..."
defaults write com.apple.finder QLEnableTextSelection -bool true

echo "Disable disk image verification ..."
defaults write com.apple.frameworks.diskimages skip-verify -bool true
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

echo "Automatically open a new Finder window when a volume is mounted ..."
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

echo "Disable the warning before emptying the Trash ..."
defaults write com.apple.finder WarnOnEmptyTrash -bool false

echo "Empty Trash securely by default ..."
defaults write com.apple.finder EmptyTrashSecurely -bool true

echo "Minimize windows into their application’s icon ..."
defaults write com.apple.dock minimize-to-application -bool true

echo "Moving dock to the left ..."
defaults write com.apple.dock orientation left

echo "Using a smaller dock size ..."
defaults write com.apple.dock tilesize -integer 36

echo "Enable spring loading for all Dock items ..."
defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true

echo "Speed up Mission Control animations ..."
defaults write com.apple.dock expose-animation-duration -float 0.1

echo "Group windows by application in Mission Control ..."
defaults write com.apple.dock "expose-group-by-app" -bool true

echo "Remove the auto-hiding Dock delay ..."
defaults write com.apple.Dock autohide-delay -float 0.0001;

echo "Remove Notification Center from Menubar ..."
launchctl remove com.apple.notificationcenterui.agent

echo "Run the screensaver if we're in the bottom-left hot corner ..."
defaults write com.apple.dock wvous-bl-corner -int 5
defaults write com.apple.dock wvous-bl-modifier -int 0

echo "Enable\"Go to recent space\" Gesture with 4 finger tap ..."
defaults write com.apple.dock double-tap-jump-back -bool TRUE

echo "Disable automatically rearrange Spaces based on recent use ..."
defaults write com.apple.dock mru-spaces -bool false

# Keyboard shortcuts
echo "Show desktop with F6"
defaults write -g NSUserKeyEquivalents '{
"Show Desktop"="\UF709";
}'

echo "Hide Spotlight icon in menubar... prompting for password"
sudo chmod 600 /System/Library/CoreServices/Search.bundle/Contents/MacOS/Search

for app in Finder Dock; do
    killall "$app" > /dev/null 2>&1
done
echo "\nDone. Note that some of these changes require a logout/restart to take effect.\n"
