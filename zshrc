export PATH="$PATH:~/flutter/bin"

# Set Variables
# Syntax highlighting for man pages using bat
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export HOMEBREW_CASK_OPTS="--no-quarantine"
export NULLCMD=bat
export N_PREFIX="$HOME/.n"
export PREFIX="$N_PREFIX"

# Change ZSH Options

# Customize Prompts
PROMPT='
%~ %# '

RPROMPT='%*'
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Apparently zsh PS1 is different from bash PS1?
#'[\[$(tput sgr0)\]\[\033[38;5;12m\]\t\[$(tput sgr0)\]] \[$(tput sgr0)\]\[\033[38;5;10m\]\u\[$(tput sgr0)\]@\[$(tput sgr0)\]\[\033[38;5;10m\]\h\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;11m\]\w\[$(tput sgr0)\]\\$ \[$(tput sgr0)\]'

# Add Locations to $path Array
typeset -U path

path=(
    "$N_PREFIX/bin"
    $path
    )

# Create Aliases
alias ls="exa"
alias l="exa -lGF"
alias ll="exa -lah --git"
alias la="exa -lah --git"
alias lt="exa -lah --git --tree --level=2"
alias rm="trash"
alias cat="bat"
alias fuck="echo $'it\'s gonna be okay'"
alias shit="echo 'do not worry'"
alias iphoneusb="sudo killall -STOP -c usbd"
alias chsongs="~/Library/Application Support/com.srylain.CloneHero"
alias firebase="`npm config get prefix`/bin/firebase"
alias mini-1="ssh administrator@198.205.118.94"
alias mini-2="ssh administrator@198.205.118.163"
alias mini-3="ssh administrator@198.205.118.162"
alias gorack="ftp jvollkommer:Vrl-2021@198.205.118.90"
alias seedbox="ftp seedbox:sbsehct1B!@rain.seedhost.eu"
alias bbd="brew bundle dump --describe --force"
alias trail="<<<'${(F)path}'"

# Write Functions
function mkcd() {
    mkdir -p "%@" && cd "$_";
}

# Use ZSH Plugins

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
#export SDKMAN_DIR="/Users/jakevollkommer/.sdkman"
#[[ -s "/Users/jakevollkommer/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/jakevollkommer/.sdkman/bin/sdkman-init.sh"
