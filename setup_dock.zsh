#!/usr/bin/env zsh

echo "\n<<< Setting up Dock >>>\n"

add_app_to_dock() {
    echo "Adding $1 to Dock"
    defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/$1.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
}

add_system_app_to_dock() {
    echo "Adding $1 to Dock"
    defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/System/Applications/$1.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
}

defaults write com.apple.dock persistent-apps -array

for app in "System Preferences" "Messages"; do
    add_system_app_to_dock $app
done

for app in "Brave Browser" "Spark" "Spotify" "Xcode" "iTerm" "Notion"; do
    add_app_to_dock $app
done

killall Dock
echo "\nDone.\n"
