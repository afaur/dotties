# Add my individual private env variables if they are present in the home dir
[[ -f $HOME/.zshrc.env ]] && source ~/.zshrc.env

# Set our zsh theme
export ZSH_THEME="candy"

# Add our .bin folder to the path
export PATH="$HOME/.bin:$PATH"

# Tell zsh where oh-my-zsh is
export ZSH="$HOME/.oh-my-zsh"

# Set nvm path variable
export NVM_DIR="$HOME/.nvm"

# Tell oh-my-zsh which plugins should be used
export plugins=(rbenv nvm autojump)

# Lets pkg-config program know where pkgconfig meta data is located
export PKG_CONFIG_PATH="/usr/local/lib;/usr/local/lib/pkgconfig"

# Lets config our devkitpro paths for nds and 3nds local dev
export PATH="$PATH:/opt/devkitpro/devkitARM/bin"
export DEVKITPRO="/opt/devkitpro/"
export DEVKITARM="/opt/devkitpro/devkitARM/"
export CTRULIB="/opt/devkitpro/libctru/"

# Config virtualenv wrapper folder (python pip3 virtualenvwrapper)
export WORKON_HOME=$HOME/.virtual-envs
#export PROJECT_HOME=$HOME/code
export VIRTUALENV_PYTHON=$(which python3)
export VIRTUALENVWRAPPER_PYTHON=$(which python3)
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'

# If virtualenvwrapper installed source it
[[ -f /usr/local/bin/virtualenvwrapper.sh ]] && source /usr/local/bin/virtualenvwrapper.sh

# Docker: Initialize our `docker-machine` environment if not started
# ------: Then set up the shell so the `docker` command uses it.
[[ -x "$(command -v docker-machine)" ]] \
  && [[ $(docker-machine status default 2> /dev/null) != 'Running' ]] \
  && echo "Please be patient: Initializing your default docker vm..." \
  && docker-machine start default > /dev/null 2>&1 \
  && eval $(docker-machine env default) > /dev/null 2>&1 \
  || eval $(docker-machine env default) > /dev/null 2>&1 \

# Path to my dotties
export MY_DOTTIES_DIR="$HOME/.dotties/packages/${GITHUB_USERNAME}-dotties"

# Path where a macvim provided vim may be
export MACVIM_VIM_PATH="/usr/local/Cellar/macvim/8.0-130/MacVim.app/Contents/MacOS/Vim"

# Path where a vim binary should be used from
export VIM_PATH="/usr/local/bin/vim"

# Initialize oh-my-zsh
source $ZSH/oh-my-zsh.sh
