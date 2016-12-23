# Setting up Mac for first time

: '
Sys pref -> keyboard -> increase key repeat and delay until
Sys pref -> bluetooth -> show in task bar
Sys pref -> accessibility -> display -> no large mouse move
Sys pref -> mouse (aft connected -> moderate tracking Spd
Sys pref -> mouse (aft connected -> turn on right side click
Sys pref -> sec and priv -> general -> require pass immediately
Sys pref -> keyboard -> modifier -> caps lock should be option
Sys pref -> power sv -> disable hd sleep etc
Mac - turn on tap to click
Copy over pgp/gpg key
Copy over ssh key
'

brew cask install chrome
: '
  - Install signal
  - Install vimium
  - Install react dev tools
  - Install meteor dev tools
  - Install Moqups
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
brew cask install skitch
brew cask install boom
brew cask install iterm
  # iTerm2 -> make iterm2 default term from iterm2 menu

# Flash air sdk
# https://airdownload.adobe.com/air/mac/download/latest/AIRSDK_Compiler.tbz2
# Rename extracted folder to .AIRSDK and move to ~/

# Flash air normal
# https://airdownload.adobe.com/air/mac/download/23.0/AdobeAIR.dmg

# Flash projector debugger
# https://fpdownload.macromedia.com/pub/flashplayer/updaters/23/flashplayer_23_sa_debug.dmg

# Install superpowers
# Install Pages
# Install Pixen
# Install Keynote
# Install Steam
# Install Yubikey piv
# Install Virtualbox
# Install Vagrant
  # Install plugin to allow file scp into vagrant controlled boxes
  # Usage: vagrant scp <some_local_file_or_dir> [vm_name]:<somewhere_on_the_vm>
  # vagrant plugin install vagrant-scp

brew install cmake
brew install git
brew install vim
brew install tmux
brew install tmate
brew install jq
brew install ag
brew install htop
brew install ffmpeg --with-fdk-aac --with-sdl2 --with-freetype --with-libass --with-libvorbis --with-libvpx --with-opus --with-x265
brew install reattach-to-user-namespace

# Use jq for pretty json
brew install jq

# Use jenv for managing java sdk
brew install jenv
# jenv add /Library/Java/JavaVirtualMachines/jdk1.8.0_112.jdk/Contents/Home
# jenv global oracle64-1.8.0.112

# Install Haxe and set haxelib install path
#   Older version
#     brew install HaxeFoundation/haxe/haxe-3.2.1
#   Newer version: Install here until brew formula is updated
#     https://haxe.org/download/file/3.4.0-rc.1/haxe-3.4.0-rc.1-osx-installer.pkg
#   Create haxelib directory to store packages
mkdir -p ~/.haxe/haxelib
#   Tell haxelib to use that directory
haxelib setup /Users/afaur/.haxe/haxelib

# Install packer
brew tap homebrew/binary
brew install packer

# Install Dart
brew install dart-lang/dart/dart

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

# Lets us uninstall python packages
easy_install pip
