# Set our zsh theme
export ZSH_THEME="candy"

# Add our .bin folder to the path
export PATH="$HOME/.bin:$PATH"

# Tell zsh where oh-my-zsh is
export ZSH="$HOME/.oh-my-zsh"

# Lets pkg-config program know where pkgconfig meta data is located
export PKG_CONFIG_PATH="/usr/local/lib;/usr/local/lib/pkgconfig"

# Tell oh-my-zsh which plugins should be used
export plugins=(rbenv nvm autojump)

# Initialize oh-my-zsh
source $ZSH/oh-my-zsh.sh
