eval "$(termium shell-hook show pre)"
# Set Variables
# Syntax highlighting for man pages using bat
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export HOMEBREW_CASK_OPTS="--no-quarantine"
export NULLCMD=bat
export N_PREFIX="$HOME/.n"
export PREFIX="$N_PREFIX"
export JDK_PREFIX="/opt/homebrew/opt/openjdk"
export RBENV="$HOME/.rbenv/shims"
export GCLOUD="$HOME/google-cloud-sdk"
export EDITOR="nvim"
# fastlane environment vars
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export SPACESHIP_2FA_SMS_DEFAULT_PHONE_NUMBER="+16317457857"
export NVIM_LOG_FILE=~/.config/nvim/nvim.log
# FZF keybindings
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS="--ansi"
export FZF_DEFAULT_COMMAND="fd --type f"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type d"
export FZF_CTRL_G_COMMAND="fd --type d"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window=up:30%:wrap"
export FZF_TMUX=1
# Open FZF in neovim
function vim_fzf() {
  local file
  file=$(fzf --preview 'bat --style=numbers --color=always {}' --preview-window=up:60%:wrap) && nvim "$file"
}
zle -N vimf
bindkey -s '^V' 'vim_fzf\n'
bindkey '^G' fzf-cd-widget

# Change ZSH Options

autoload -U promptinit && promptinit
# Customize Prompts
PROMPT='
%{%F{red}%}%n%{%f%}@%{%F{blue}%}%m %{%F{yellow}%}%~ %{%f%}%# '

RPROMPT='%*'
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
autoload -Uz compinit && compinit

# Default pyenv for python
eval "$(pyenv init --path)"
# Default rbenv for ruby
eval "$(rbenv init - zsh)"

# Add Locations to $path Array
typeset -U path

path=(
    "$N_PREFIX/bin"
    "$RBENV/bin"
    "$DOTFILES/bin"
    "$HOME/.dotfiles/bin"
    "$JDK_PREFIX/bin"
    "$GCLOUD/bin"
    "usr/local/bin"
    "~/flutter/bin"
    $path
    )

# Create Aliases
# Prefer nvim over vim
alias vim="nvim"
alias ls="exa"
alias l="exa -lah"
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
alias mini-4="ssh administrator@173.8.55.67"
alias macincloud="ssh admin@DU248101.macincloud.com"
alias azure="ssh ios-dev@172.174.128.148"
alias orack=zure"ftp jvollkommer:Vrl-2021@198.205.118.90"
alias seedbox="ftp seedbox:sbsehct1B!@rain.seedhost.eu"
alias bbd="brew bundle dump --describe --force"
alias trail="<<<'${(F)path}'"
alias vimrc="vim ~/.vimrc"
alias zshrc="vim ~/.zshrc"
alias seedbox="ftp seedbox@rain.seedhost.eu"
# Xcode builds
alias buildcpg="xcodebuild PROVISIONING_PROFILE=c040db53-b2fd-4278-beed-3b755b6527a1 -project ~/Work/VRLink/Projects/VRLink/Legacy/VRLink/VRLink.xcodeproj -scheme \"VRLink CPG\" -archivePath ~/Work/VRLink/Archives/Legacy/CPG/ -sdk iphoneos -arch \"armv6 armv7\" clean archive"
# Use non-rosetta pod
alias pod="arch -x86_64 pod"
alias bundle="arch -x86_64 bundle"
alias fastlane="bundle exec fastlane"
alias flsession="fastlane spaceauth --copy-to-clipboard > /dev/null 2>&1 && gh secret set FASTLANE_SESSION -b '\$(pbpaste)'"
alias disablesleep="sudo pmset -b sleep 0; sudo pmset -b disablesleep 1"
alias allowsleep="sudo pmset -b sleep 0; sudo pmset -b disablesleep 0"
# Kill all emulator processes (Firebase)
alias killemulators="pkill -f 'firebase.*emulator.*' "

# Filesystem aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....="cd ../../.."
alias .....="cd ../../../.."

# tmux aliases
alias ta='tmux attach'
alias tls='tmux ls'
alias tat='tmux attach -t'
alias tns='tmux new-session -s'

# Write Functions
function mkcd() {
    mkdir -p "%@" && cd "$_";
}

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniforge/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniforge/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

eval "$(termium shell-hook show post)"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
fi
