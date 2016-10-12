ZSH_THEME="candy"
export PATH="$HOME/.bin:$PATH"
export ZSH=~/.oh-my-zsh

alias ls="exa"
alias cls="clear"

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
export CB=$'%{$fg[blue]%}'
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

export PKG_CONFIG_PATH="/usr/local/lib;/usr/local/lib/pkgconfig"

[[ -f ~/.zshrc.env ]] && source ~/.zshrc.env

if [ -x /usr/libexec/path_helper ]; then
  eval `/usr/libexec/path_helper -s`
fi

#source $HOME/.cargo/env
