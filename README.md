# dotfiles

My OS X setup using [Nushell](https://www.nushell.sh) and [Helix](https://helix-editor.com) editor. Take what you like.
  
## Configuration

1. Install [Homebrew](https://brew.sh) and [iTerm2](https://iterm2.com)
2. `git clone git@github.com:alexmingoia/dotfiles.git ~/.dotfiles`
3. Symlink nushell configs `ln -s ~/.dotfiles/nushell ~/Library/Application\ Support/`
4. Symlink helix configs `ln -s ~/.dotfiles/helix ~/.config/`
5. Install nushell and helix `brew install nushell hx`
6. Set the default shell to nushell in iTerm2's Settings > Profiles > Default > General, under "Command". Use `which nu` to get the executable path.
7. Set the colors to match Helix's theme in iTerm2's Settings > Profiles > Default > Colors, then import the color preset from this repository.
