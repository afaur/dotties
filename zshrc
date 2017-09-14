# Setup my custom env variables and initialize oh-my-zsh
[[ -f $HOME/.my_env_vars.zsh ]] && source "$HOME/.my_env_vars.zsh"

# Setup my custom functions and prompt configuration
[[ -f $HOME/.my_functions.zsh ]] && source "$HOME/.my_functions.zsh"

# Setup my custom keyboard combo shortcuts
[[ -f $HOME/.my_shortcuts.zsh ]] && source "$HOME/.my_shortcuts.zsh"

# Setup my conditional custom installer scripts
[[ -f $HOME/.my_installers.zsh ]] && source "$HOME/.my_installers.zsh"

# If the path_helper binary exists use it to help with command path resolution
if [ -x /usr/libexec/path_helper ]; then
  eval `/usr/libexec/path_helper -s`
fi

# Depending on what is installed make a json alias (jq is best so it overrides)
[[ -x $(command -v pygmentize) ]] && alias json="python -m json.tool | pygmentize -l javascript"
[[ -x $(command -v jq) ]] && alias json="jq"

# If cargo/rust installed source cargo env
[[ -f $HOME/.cargo/env ]] && source "$HOME/.cargo/env"

# If Haxe is installed then set the haxe std path variable
[[ -x "$(command -v haxe)" ]] && export HAXE_STD_PATH="/usr/local/lib/haxe/std"

# If air sdk is installed then add the bin directory to the path
[[ -f $HOME/.AIRSDK/bin/adl ]] && export PATH="$HOME/.AIRSDK/bin:$PATH"

# If Qt sdk is installed then add the bin directory to the path
[[ -f /usr/local/opt/qt/bin/qmake ]] && export PATH="/usr/local/opt/qt/bin:$PATH"

# If virtualenvwrapper installed source it
[[ -f /usr/local/bin/virtualenvwrapper.sh ]] && source /usr/local/bin/virtualenvwrapper.sh

# If rvm installed source it
[[ -f /etc/profile.d/rvm.sh ]] && source /etc/profile.d/rvm.sh

# If jenv installed add to path and init it
[[ -d $HOME/.jenv/bin ]] && export PATH="$HOME/.jenv/bin:$PATH"
[[ -x "$(command -v jenv)" ]] && eval "$(jenv init -)"

# Link my vim files to neo vim if not already linked
[[ ! -s $HOME/.config/nvim ]] \
  && ln -s ~/.vim ~/.config/nvim \
  && ln -s ~/.vimrc ~/.config/nvim/init.vim

# Use latest vim if installed using brew
[[ -f $VIM_PATH ]] && alias vim=$VIM_PATH

# Use macvim provided vim binary if installed
#[[ -f $MACVIM_VIM_PATH ]] && alias vim=$MACVIM_VIM_PATH

# Use function for mvim (clientserver)
[[ -f $MACVIM_VIM_PATH ]] && alias mvim="run_mvim"

# Handle torch (luajit/luarocks/trepl)
[[ -f $HOME/torch/install/bin/torch-activate ]] && source $HOME/torch/install/bin/torch-activate
