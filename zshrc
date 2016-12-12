ZSH_THEME="candy"
export PATH="$HOME/.bin:$PATH"
export ZSH=~/.oh-my-zsh

# Load nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

export PKG_CONFIG_PATH="/usr/local/lib;/usr/local/lib/pkgconfig"

setnvm() {
 if [ "$PWD" != "$MYOLDPWD" ]; then
   MYOLDPWD="$PWD";
   if [ -e "$PWD/.nvmrc" ]; then
     nvm use
   fi
 fi
}
function cd () { builtin cd "$@" && setnvm; }

plugins=(rbenv nvm autojump)

source $ZSH/oh-my-zsh.sh

# -- Begin Prompt configuration --

# Colors - Color White, etc
export CB=$'%{$fg_bold[blue]%}'
export CBB=$'%{$fg_bold[blue]%}'
export CBG=$'%{$fg_bold[green]%}'
export CW=$'%{$fg[white]%}'

# Reset
export RS=$'%{$reset_color%}'

# Newline
export NL=$'\n'

# Modify the prompt to contain git branch name if applicable
git_info() {
  current_branch=$(git current-branch 2> /dev/null)
  if [[ -n $current_branch ]]; then
    echo " ${CBG}${current_branch}${RS}"
  fi
}

# Enable prompt substitution
setopt promptsubst

# Executed before each prompt print
precmd() {
  # Where Local and Where Remote
  export WL=$'%{$fg_bold[green]%}[LOCAL] '
  export WR=$'%{$fg_bold[green]%}%n@%m '

  # Datetime print
  export DT=$'%D{[%X]} '

  # Folder print
  export FP=$'[%3/] '

  # Git Prompt print
  export GP=$'$(git_prompt_info) '

  # Command Prompt
  export CP="${CB}->${CBB} %# ${RS}"

  # Main Prompt
  export MP="${CB}${DT}${RS}${GP}${NL}${CW}${FP}${NL}${CP}"
}

# If we are on our own computer show [LOCAL]
remote_vs_local_display () {
  if [[ ${(%):-%m} = "Adams-MBP" ]]; then
    PS1="${MP}"
  else
    PS1="${MP}"
  fi
}

# Enable precmd functions
typeset -a precmd_functions
precmd_functions+=(remote_vs_local_display)
# -- End Prompt configuration --

[[ -f ~/.zshrc.env ]] && source ~/.zshrc.env

if [ -x /usr/libexec/path_helper ]; then
  eval `/usr/libexec/path_helper -s`
fi

alias ll="~/.bin/exa"
alias cls="clear"

# Depending on what is installed make a json alias (jq is best so it overrides)
[[ -x $(command -v pygmentize) ]] && alias json="python -m json.tool | pygmentize -l javascript"
[[ -x $(command -v jq) ]] && alias json="jq"

function getip {
  # Ping whatever site was passed as the first argument
  # Strip the ip address returned from the output
  # Remove newlines from the end of the response output
  # Copy the returned value to the clipboard
  ping -c 1 $1 | grep "64 bytes from " | awk '{print $4}' | cut -d":" -f1 | tr -d "\n" | pbcopy
}

function chkport {
  # Checks what application if any is listening on a port
  lsof -n -i:$1 | grep LISTEN
}

# If dotties is installed then make some functions
MY_DOTTIES_DIR="$HOME/.dotties/packages/afaur-dotties"
if [[ -d $MY_DOTTIES_DIR ]] ; then
  function dhelp {
    echo "Commands";
    echo "dssh, dclean, dreset, dcommit 'msg', dpull, dpush, dedit";
  }
  function dssh {
    cd $MY_DOTTIES_DIR && \
    git-ssh afaur/dotties && \
    git branch --set-upstream-to=origin/master && \
    cd -
  }
  function dclean {
    cd $MY_DOTTIES_DIR && \
    git clean -df && \
    cd -
  }
  function dreset {
    cd $MY_DOTTIES_DIR && \
    git reset --hard origin/master && \
    cd -
  }
  function dcommit {
    cd $MY_DOTTIES_DIR && \
    git add -A && \
    git commit -m $1 && \
    cd -
  }
  function dpull {
    cd $MY_DOTTIES_DIR && \
    git pull && \
    cd -
  }
  function dpush {
    cd $MY_DOTTIES_DIR && \
    git push && \
    cd -
  }
  function dedit {
    cd $MY_DOTTIES_DIR && \
    vim && \
    cd -
  }
fi

# If cargo/rust installed source cargo env
[[ -f $HOME/.cargo/env ]] && source ~/.cargo/env

# If Haxe is installed then set the haxe std path variable
[[ -x "$(command -v haxe)" ]] && export HAXE_STD_PATH="/usr/local/lib/haxe/std"

# If air sdk is installed then add the bin directory to the path
[[ -f $HOME/.AIRSDK/bin/adl ]] && export PATH="$HOME/.AIRSDK/bin:$PATH"

# If virtualenvwrapper installed source it
[[ -f /usr/local/bin/virtualenvwrapper.sh ]] && source /usr/local/bin/virtualenvwrapper.sh

# If rvm install source it
[[ -f /etc/profile.d/rvm.sh ]] && source /etc/profile.d/rvm.sh

# Use latest vim if installed using brew
[[ -f /usr/local/bin/vim ]] && alias vim="/usr/local/bin/vim"
