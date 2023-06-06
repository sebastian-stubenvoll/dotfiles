#Start applying pywal colors in the background
(cat ~/.cache/wal/sequences &)

export ZSH="/Users/sebastian/.oh-my-zsh"
export SKHD_DIR="/Users/sebastian/.config/skhd"
export SKHD_PROFILE_OVERWRITE=false

#oh-my-zsh plugins
plugins=(git fast-syntax-highlighting colored-man-pages copypath tmux copyfile jsontools zsh-autosuggestions virtualenv virtualenvwrapper)

source $ZSH/oh-my-zsh.sh

export LSCOLORS=ExBxGxFxDxxexbDxGxxfxd

export EDITOR='nvim'
export VIRTUAL_ENV_DISABLE_PROMPT=1

#adb fastboot
if [ -d "$HOME/adb-fastboot/platform-tools" ] ; then
 export PATH="$HOME/adb-fastboot/platform-tools:$PATH"
fi

#Zathura themeing
export PATH="/Users/sebastian/.local/bin:$PATH"

#aliases
alias neofetch='neofetch --iterm2 ~/.config/bunt/wallpaper'
alias ls='exa'
alias l='exa -lah'
alias UPDATE='brew update && brew upgrade && brew cleanup && cargo install-update -a && nvim -c "PlugUpgrade | PlugUpdate | qall" && pip install -U pip && pip install -U pynvim neovim-remote rope spotify-cli'

#dbus
export DBUS_SESSION_BUS_ADDRESS="unix:path=$DBUS_LAUNCHD_SESSION_BUS_SOCKET"

#Android SDK
export ANDROID_HOME="${HOME}/Library/Android/sdk"
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

#PICO SDK
export PICO_SDK_PATH="${HOME}/Documents/projects/pico-sdk"

#Flutter SDK
export PATH=$PATH:${HOME}/flutter/bin

#Graph-easy
PERL5_PREFIX=`ls -d /usr/local/Cellar/perl/$(/usr/local/bin/perl -e 'print substr($^V, 1)')*`
export PATH=$PATH:$PERL5_PREFIX/bin

eval "$(starship init zsh)"

eval $(thefuck --alias)
eval "$(/usr/local/bin/rtx activate zsh)"
