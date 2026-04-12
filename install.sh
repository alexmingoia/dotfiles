#!/bin/sh

# Install xCode cli tools
echo "Installing commandline tools..."
xcode-select --install

# Homebrew
## Install
echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew analytics off

## Formulae
echo "Installing formulae..."
### Essentials
brew install --cask iterm2
brew install --cask aerospace
brew install wget
brew install jq
brew install borders
brew install --cask inkscape
brew install --cask zoom
brew install --cask vlc

### Terminal
brew install nushell
brew install tmux
brew install helix
brew install asciinema

### Programming
brew install git
brew install raine/workmux/workmux

### Fonts
brew install --cask sf-symbols
brew install --cask font-sf-mono
brew install --cask font-sf-pro
brew install --cask font-jetbrains-mono

# Copy and check out configuration files
echo "Downloading dotfiles..."
[ ! -d "$HOME/.dotfiles" ] && git clone --bare git@github.com:alexmingoia/dotfiles.git $HOME/.dotfiles
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout master

# macOS Settings
echo "Changing MacOS defaults..."
defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.spaces spans-displays -bool false
defaults write com.apple.dock autohide -bool true # auto-hide dock
defaults write com.apple.LaunchServices LSQuarantine -bool false
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 10
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write NSGlobalDomain _HIHideMenuBar -bool true
defaults write com.apple.screencapture location -string "$HOME/Downloads"
defaults write com.apple.screencapture disable-shadow -bool true
defaults write com.apple.screencapture type -string "png"
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false
defaults write -g NSWindowShouldDragOnGesture YES

# Suppress login shell announcement
ln -s ~/.dotfiles/.hushlogin ~/.hushlogin

# Link configuration
echo "Linking configuration files..."

touch ~/.env.nu
ln -s ~/.dotfiles/nushell ~/Library/Application\ Support/`
ln -s ~/.dotfiles/.config/tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/.config/helix ~/.config/helix
ln -s ~/.dotfiles/.aerospace.toml ~/.aerospace.toml
ln -s ~/.dotfiles/iterm2/profiles/Profiles.json ~/Library/Application\ Support/iTerm2/DynamicProfiles/Profiles.json

# Start services
echo "Starting services..."
# brew services start <service>

echo "Configuration complete."
