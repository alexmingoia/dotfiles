#!/bin/sh

# Install Xcode cli tools
echo "Installing commandline tools..."
xcode-select --install

# Homebrew
echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew analytics off

# Tools
echo "Installing formulae..."
brew install git
brew install wget
brew install jq
brew install --cask iterm2
brew install --cask aerospace
brew install nushell
brew install tmux
brew install nvim
brew install fzf
brew install ripgrep
brew install fd
brew install mise
brew install --cask sf-symbols
brew install --cask font-sf-mono
brew install --cask font-sf-pro
brew install --cask font-jetbrains-mono

# MacOS Settings
echo "Changing MacOS defaults..."

# Suppress login shell announcement
touch "$HOME/.hushlogin"
echo "  Disabled login shell announcement"

# Save screenshots to dedicated folder
mkdir -p "$HOME/Screenshots"
defaults write com.apple.screencapture location -string "$HOME/Screenshots"
defaults write com.apple.screencapture disable-shadow -bool true
defaults write com.apple.screencapture type -string "png"
echo "  Set Screen Capture to save png without shadow to ~/Screenshots"

# Disable spaces spanning displays
defaults write com.apple.spaces spans-displays -bool false
echo "  Disabled Spaces spanning displays"

# Auto-hide dock
defaults write com.apple.dock autohide -bool true
echo "  Set Dock to auto-hide"

# Set minimum key delay
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 10
echo "  Set minimum key repeat delay"

defaults write NSGlobalDomain AppleShowAllExtensions -bool true
echo "  Set Finder to show all file extensions"

defaults write com.apple.LaunchServices LSQuarantine -bool false
echo "  Disabled file download quarantine warning"

defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false
echo "  Disabled copying email recipient name to clipboard"

defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
echo "  Set Finder default search scope to current folder"

defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
echo "  Set Finder to show POSIX path in title"

defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
echo "  Set Finder to default to list view"

defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
echo "  Disabled Finder extension change warning"

# Disable auto-opening Safari downloads and enable developer tools
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
echo "  Disabled Safari auto-open downloads"
echo "  Enabled Safari Developer Tools"

# Copy and check out configuration files
echo "Installing dotfiles..."
[ ! -d "$HOME/.dotfiles" ] && git clone --bare git@github.com:alexmingoia/dotfiles.git $HOME/.dotfiles
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout master

# Create nushell user env (required by nushell env config)
touch "$HOME/.env.nu"

# Create ~/.config if needed
if [ ! -d "$HOME/.config" ]; then
  mkdir -p "$HOME/.config"
  echo "  Created ~/.config directory"
fi

if [ -d "$HOME/Library/Application Support/nushell" ]; then
  echo "  Skipped Nushell configuration (already exists)"
else
  ln -s ~/.dotfiles/.config/nushell ~/Library/Application\ Support/
  echo "  Linked Nushell configuration to ~/Library/Application Support/nushell"
fi

if [ -f "$HOME/.tmux.conf" ]; then
  echo "  Skipped Tmux configuration (already exists)"
else
  ln -s ~/.dotfiles/.config/tmux/.tmux.conf ~/.tmux.conf
  echo "  Linked tmux configuration to ~/.tmux.conf"
fi

if [ -f "$HOME/.aerospace.toml" ]; then
  echo "  Skipped Aerospace configuration (already exists)"
else
  ln -s ~/.dotfiles/.config/aerospace/.aerospace.toml ~/.aerospace.toml
  echo "  Linked Aerospace configuration to ~/.aerospace.toml"
fi

if [ -d "$HOME/.config/nvim" ]; then
  echo "  Skipped Neovim configuration (already exists)"
else
  ln -s ~/.dotfiles/.config/nvim ~/.config/nvim
  echo "  Linked Neovim configuration to ~/.config/nvim"
fi

if [ -f "$HOME/Library/Application Support/iTerm2/DynamicProfiles/Profiles.json" ]; then
  echo "  Skipping iTerm configuration (Dynamic Profiles already exist)"
else
  ln -s ~/.dotfiles/.config/iterm2/Profiles.json ~/Library/Application\ Support/iTerm2/DynamicProfiles/Profiles.json
  echo "  Linked iTerm configuration"
fi

echo "Installation complete!"
