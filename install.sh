#!/bin/sh

# Install xCode cli tools
echo "Installing commandline tools..."
xcode-select --install

# Homebrew
## Install
echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew analytics off

## Taps
echo "Tapping formulae..."
brew tap FelixKratz/formulae

## Formulae
echo "Installing formulae..."
### Essentials
brew install --cask iterm2
brew install --cask aerospace
brew install wget
brew install jq
brew install sketchybar
brew install borders
brew install --cask inkscape
brew install --cask zoom
brew install --cask vlc

### Terminal
brew install helix
brew install asciinema

### Fonts
brew install --cask sf-symbols
brew install --cask font-sf-mono
brew install --cask font-sf-pro
brew install --cask font-jetbrains-mono

# macOS Settings
echo "Changing MacOS defaults..."
defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.spaces spans-displays -bool false
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock "mru-spaces" -bool "false"
defaults write com.apple.LaunchServices LSQuarantine -bool false
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write NSGlobalDomain _HIHideMenuBar -bool true
defaults write com.apple.screencapture location -string "$HOME/Downloads"
defaults write com.apple.screencapture disable-shadow -bool true
defaults write com.apple.screencapture type -string "png"
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
defaults write com.apple.finder ShowStatusBar -bool false
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool YES
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false
defaults write -g NSWindowShouldDragOnGesture YES

# Suppress login shell announcement
ln -s ~/.dotfiles/.hushlogin ~/.hushlogin

# Copy and check out configuration files
echo "Downloading dotfiles..."
[ ! -d "$HOME/.dotfiles" ] && git clone --bare git@github.com:alexmingoia/dotfiles.git $HOME/.dotfiles
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout master

# Installing Fonts
git clone git@github.com:shaunsingh/SFMono-Nerd-Font-Ligaturized.git /tmp/SFMono_Nerd_Font
mv /tmp/SFMono_Nerd_Font/* $HOME/Library/Fonts
rm -rf /tmp/SFMono_Nerd_Font/

curl -L https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v2.0.40/sketchybar-app-font.ttf -o $HOME/Library/Fonts/sketchybar-app-font.ttf

# Copy shell configuration
echo "Copying Nu configuration..."
touch ~/.env.nu
ln -s ~/.dotfiles/nushell ~/Library/Application\ Support/`

# Copy editor configuration
echo "Copying Helix configuration..."
ln -s ~/.dotfiles/.config/helix ~/.config/helix

# Copy Aerospace configuration
echo "Copying Aerospace configuration..."
ln -s ~/.dotfiles/.aerospace.toml ~/.aerospace.toml

# Copy Sketchybar configuration
echo "Copying Sketchybar configuration..."
ln -s ~/.dotfiles/.config/sketchybar ~/.config/sketchybar

# Installing helix language server
git clone https://github.com/estin/simple-completion-language-server.git /tmp/simple-completion-language-server
(cd /tmp/simple-completion-language-server && cargo install --path .)
rm -rf /tmp/simple-completion-language-server

# Start services
echo "Starting services..."
brew services start sketchybar
