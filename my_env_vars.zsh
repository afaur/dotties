# Add my individual private env variables if they are present in the home dir
[[ -f $HOME/.zshrc.env ]] && source ~/.zshrc.env

# Set our zsh theme
export ZSH_THEME="candy"

# Add our .bin folder to the path
export PATH="$HOME/.bin:$PATH"

# Tell zsh where oh-my-zsh is
export ZSH="$HOME/.oh-my-zsh"

# Tell oh-my-zsh which plugins should be used
export plugins=(rbenv nvm autojump)

# Lets pkg-config program know where pkgconfig meta data is located
export PKG_CONFIG_PATH="/usr/local/lib;/usr/local/lib/pkgconfig"

# Path to my dotties
export MY_DOTTIES_DIR="$HOME/.dotties/packages/${GITHUB_USERNAME}-dotties"

# Initialize oh-my-zsh
source $ZSH/oh-my-zsh.sh
