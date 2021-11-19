#!/usr/bin/env zsh

echo "\n<<< Setting up Dock >>>\n"

add_to_dock() {
    echo "Adding $1 to Dock"
    defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/$1.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
}

for app in "Brave" "Spark" "Spotify" "Xcode" "iTerm"; do
    add_to_dock $app
done

killall Dock
echo "\nDone.\n"
