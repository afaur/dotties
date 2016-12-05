#Setting up Mac for first time
# Mac - turn on tap to click
# Copy over pgp/gpg key
# Copy over ssh key

: '
Sys pref -> keyboard -> increase key repeat and delay until
Sys pref -> bluetooth -> show in task bar
Sys pref -> accessibility -> display -> no large mouse move
Sys pref -> mouse (aft connected -> moderate tracking Spd
Sys pref -> mouse (aft connected -> turn on right side click
Sys pref -> sec and priv -> general -> require pass immediately
Sys pref -> keyboard -> modifier -> caps lock should be option
Sys pref -> power sv -> disable hd sleep etc
'

brew cask install chrome
: '
  - Install vimium
  - Install react dev tools
  - Install meteor dev tools
  - Turn off both use prediction service options under privacy
  - Turn off use a web service to help resolve nav errors
  - Turn off let anyone add a person to chrome
  - Default webpage should be
      - https://www.google.com/gmail/about/
'
brew cask install vlc
brew cask install 1password
brew cask install dropbox
brew cask install meld
brew cask install visual-studio-code
brew cask install screenhero
brew cask install ableton-live
brew cask install cycling74-max
brew cask isntall skitch
brew cask install boom
brew cask install iterm
  # iTerm2 -> make iterm2 default term from iterm2 menu
# Install superpowers
# Install Pages
# Install Pixen
# Install Keynote

brew install cmake
brew install git
brew install vim
brew install tmux
brew install tmate
brew install jq
brew install ag
brew install htop
brew install reattach-to-user-namespace

# oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# dotties
brew install tinytacoteam/formulae/dotties
dotties install afaur/dotties

# rust
curl https://sh.rustup.rs -sSf | sh
rustup install stable

# nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash
nvm install 0.10.32
nvm alias default 0.10.32
nvm use 0.10.32

# meteor
curl https://install.meteor.com/ | sh
sudo npm install -g meteorite
