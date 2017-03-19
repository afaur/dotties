# Setup my custom env variables and initialize oh-my-zsh
[[ -f $HOME/.my_env_vars.zsh ]] && source "$HOME/.my_env_vars.zsh"

# Setup my custom functions and prompt configuration
[[ -f $HOME/.my_functions.zsh ]] && source "$HOME/.my_functions.zsh"

# If the path_helper binary exists use it to help with command path resolution
if [ -x /usr/libexec/path_helper ]; then
  eval `/usr/libexec/path_helper -s`
fi

# Depending on what is installed make a json alias (jq is best so it overrides)
[[ -x $(command -v pygmentize) ]] && alias json="python -m json.tool | pygmentize -l javascript"
[[ -x $(command -v jq) ]] && alias json="jq"

# If cargo/rust installed source cargo env
[[ -f $HOME/.cargo/env ]] && source ~/.cargo/env

# If Haxe is installed then set the haxe std path variable
[[ -x "$(command -v haxe)" ]] && export HAXE_STD_PATH="/usr/local/lib/haxe/std"

# If air sdk is installed then add the bin directory to the path
[[ -f $HOME/.AIRSDK/bin/adl ]] && export PATH="$HOME/.AIRSDK/bin:$PATH"

# If virtualenvwrapper installed source it
[[ -f /usr/local/bin/virtualenvwrapper.sh ]] && source /usr/local/bin/virtualenvwrapper.sh

# If rvm installed source it
[[ -f /etc/profile.d/rvm.sh ]] && source /etc/profile.d/rvm.sh

# If jenv installed add to path and init it
[[ -d $HOME/.jenv/bin ]] && export PATH="$HOME/.jenv/bin:$PATH"
[[ -x "$(command -v jenv)" ]] && eval "$(jenv init -)"

# Use latest vim if installed using brew
[[ -f /usr/local/bin/vim ]] && alias vim="/usr/local/bin/vim"

# Use luaver if installed
[[ -f /usr/local/bin/luaver ]] && source /usr/local/bin/luaver
