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
brew cask install xquartz
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

# Install Xamarin
# Install Epic Games Launcher (to install unreal engine)
# Install Gobbler2 (for Softube audio plugins)
# Install Audio Overload
# Install OpenToonz (art animation stuido)
# Install WinSkin wrapped
  # - NanoFL
  # - RO Origins
# Install PortingKit
# Install Wacom Tablet
# Install SynfigStudio
# Install AnimationDesk
# Install Citra-qt (local dev of homebrew 3DS)
# Install SoundFlower 2.0b2
# Install Daz3d
# Install Blender
# Install Sculptris Alpha 6
# Install XCode
# Install Keka
# Install Aria Maestosa
# Install XQuartz
# Install Inkscape
# Install MediBangPaintPro
# Install FireAlpaca
# Install Bfxr
# Install Synthesia
# Install superpowers
# Install Pages
# Install Pixen
# Install Keynote
# Install Postman
# Install Steam
# Install Yubikey piv
# Install Virtualbox
# Install Vagrant
  # Install plugin to allow file scp into vagrant controlled boxes
  # Usage: vagrant scp <some_local_file_or_dir> [vm_name]:<somewhere_on_the_vm>
  # vagrant plugin install vagrant-scp

brew install pkgconfig p7zip bazel sdl2 qt5 cmake boost git python
brew install neovim/neovim/neovim mvim vim tmux tmate
brew install ffmpeg --with-fdk-aac --with-sdl2 --with-freetype \
  --with-libass --with-libvorbis --with-libvpx --with-opus --with-x265
brew install docker-machine docker docker-compose jq ag htop tree autojump
brew install reattach-to-user-namespace wget couchdb rbenv httpie lynx vala meson
brew install premake libsoup fcgi gtk+3 libgee allegro little-cms

# install https://sourceforge.net/projects/libmng/files/libmng-devel/2.0.3
brew install emscripten groonga imagemagick readline
brew install libjpeg zeromq graphicsmagick openssl

# force link of readline from brew
brew link readline --force

# remove gnuplot if installed and install from brew with flags
brew list -1 | grep -q "^gnuplot\$" && brew remove gnuplot
brew install gnuplot --with-wxmac --with-cairo --with-pdflib-lite \
  --with-x11 --without-lua

brew install qt || true

# Install torch for lua development
# Follow directions for setup
# https://github.com/torch/distro.git
# Then install any additional packages:
# luarocks install moonscript
# install nginx with lua support, set misc module provides `set_by_lua`
brew install homebrew/nginx/nginx-full --with-lua-module --with-set-misc-module

# Install the maven version manager
brew install mvnvm

# Install leiningen for managing clojure projects
brew install leiningen

# Install gemfire
brew tap pivotal/tap && brew install gemfire

# Lets us uninstall python packages
easy_install pip

# Install lxml
pip install lxml

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
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash

# node@7
nvm install 0.10.32
nvm install 7
nvm install 8

# Set default
nvm alias default 7
nvm use 7

# Allows vim-flow to check js
npm install -g flow eslint babel-eslint eslint-plugin-flowtype

# meteor
curl https://install.meteor.com/ | sh
sudo npm install -g meteorite
