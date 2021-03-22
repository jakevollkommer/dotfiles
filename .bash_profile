alias jc="javac *.java"
alias l="ls -GFh"
alias ls="ls -GFh"
alias ll="ls -lA"
alias la="ls -A"
alias webdev="cd ~/Desktop/Me/Learn/WebDev"
alias bots="cd ~/Desktop/Me/Hustles/OSRS\ Bots"
alias myjt="jt -t monokai -tf merriserif -tfs 8 -nf ptsans -nfs 10 -fs 10"
alias selenc="javac -classpath selenium-server-standalone-3.0.0.jar"
alias selen="java -cp .:selenium-server-standalone-3.0.0.jar"
alias junit="java org.junit.runner.JUnitCore"
alias fuck="echo $'it\'s gonna be okay'"
alias shit="echo 'do not worry'"
alias iphoneusb="sudo killall -STOP -c usbd"
alias chsongs="~/Library/Application Support/com.srylain.CloneHero"
alias sshacc="ssh -i \"account-creator.pem\" ubuntu@ec2-18-221-230-215.us-east-2.compute.amazonaws.com"
alias copytut="cp ~/Desktop/Me/Hustles/OSRS\ Bots/src/tutorialIsland/* ~/Desktop/Me/Hustles/OSRS\ Bots/OSRS_Bots/Tutorial\ Island/tutorialIsland/"
alias oprs="java -jar /Applications/OpenOSRS.jar"
alias vibe="cd ~/VibeCheck/VibeCheck/"
alias firebase="`npm config get prefix`/bin/firebase"
alias mini-1="ssh administrator@198.205.118.94"
alias mini-2="ssh administrator@198.205.118.163"
alias mini-3="ssh administrator@198.205.118.162"
#export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export PS1="[\[$(tput sgr0)\]\[\033[38;5;12m\]\t\[$(tput sgr0)\]] \[$(tput sgr0)\]\[\033[38;5;10m\]\u\[$(tput sgr0)\]@\[$(tput sgr0)\]\[\033[38;5;10m\]\h\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;11m\]\w\[$(tput sgr0)\]\\$ \[$(tput sgr0)\]"
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Put pypy on my path
PATH=$PATH:$HOME/pypy2-v5.9.0-osx64/bin
export PATH

export PATH="/usr/local/anaconda3/bin:$PATH"

# configure ANDROID HOME environment variable
export ANDROID_HOME=~/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/jakevollkommer/.sdkman"
[[ -s "/Users/jakevollkommer/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/jakevollkommer/.sdkman/bin/sdkman-init.sh"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jakevollkommer/Downloads/google-cloud-sdk/path.bash.inc' ]; then . '/Users/jakevollkommer/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jakevollkommer/Downloads/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/jakevollkommer/Downloads/google-cloud-sdk/completion.bash.inc'; fi
