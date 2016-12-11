ZSH_THEME="candy"
export PATH="$HOME/.bin:$PATH"
export ZSH=~/.oh-my-zsh

export NVM_DIR="/Users/afaur/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

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

alias ls="~/.bin/exa"
alias cls="clear"
alias json="python -m json.tool | pygmentize -l javascript"

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
if [[ -d ~/.dotties/packages/afaur-dotties ]] ; then
  function dcommit {
    cd ~/.dotties/packages/afaur-dotties && \
    git remote rm origin && \
    git remote add origin git@github.com:afaur/dotties.git && \
    git add -A && \
    git commit -m $1 && \
    cd -
  }
  function dpush {
    cd ~/.dotties/packages/afaur-dotties && \
    git push && \
    cd -
  }
  function dedit {
    cd ~/.dotties/packages/afaur-dotties && \
    vim && \
    cd -
  }
fi

# If cargo/rust installed source cargo env
[[ -f ~/.cargo/env ]] && source ~/.cargo/env

# If Haxe is installed then set the haxe std path variable
[[ -x "$(command -v haxe)" ]] && export HAXE_STD_PATH="/usr/local/lib/haxe/std"

# If air sdk is installed then add the bin directory to the path
[[ -f ~/.AIRSDK/bin/adl ]] && export PATH="/Users/afaur/.AIRSDK/bin:$PATH"

# If virtualenvwrapper installed source it
[[ -f /usr/local/bin/virtualenvwrapper.sh ]] && source /usr/local/bin/virtualenvwrapper.sh

# If rvm install source it
[[ -f /etc/profile.d/rvm.sh ]] && source /etc/profile.d/rvm.sh

# Use latest vim if installed using brew
[[ -f /usr/local/bin/vim ]] && alias vim="/usr/local/bin/vim"
