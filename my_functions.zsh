# Make `ll` to use the exa command (exa binary only compiled for mac osx sierra)
alias ll="~/.bin/exa"

# Make `cls` be a shortcut to running `clear`
alias cls="clear"

# Make `sl` become `ls`
alias sl="ls"

# Make `tree` ignore node_modules
alias tree="tree -I 'node_modules'"

# Make `mvn archetype:generate` be `mvn-init`
alias mvn-init="mvn archetype:generate"

# First mvim run should become a listen server for any file open requests
function run_mvim {
  mvim --serverlist | grep -q VIM
  if [ $? -eq 0 ]; then
    if [ $# -eq 0 ]; then
      mvim
    else
      mvim --remote "$@"
    fi
  else
    mvim --servername VIM "$@"
  fi
}

# Write our individual settings to the gitconfig file
function dgitconfig () {
  if ! [[ -z $GITHUB_USERNAME ]] && \
     ! [[ -z $GITHUB_FULLNAME ]] && \
     ! [[ -z $GITHUB_EMAIL ]] && \
     ! [[ -z $GITHUB_GPG_SIGN_KEY ]] && \
     ! [[ -z $GITHUB_GPG_SHOULD_SIGN ]] ; then

    # Create a non tracked custom gitconfig
    export GITHUB_CUSTOM_GITCONFIG="$HOME/.${GITHUB_USERNAME}-gitconfig"

    git config \
      --file="$GITHUB_CUSTOM_GITCONFIG" \
      user.name $GITHUB_FULLNAME

    git config \
      --file="$GITHUB_CUSTOM_GITCONFIG" \
      user.email $GITHUB_EMAIL

    git config \
      --file="$GITHUB_CUSTOM_GITCONFIG" \
      user.signingkey $GITHUB_GPG_SIGN_KEY

    git config \
      --file="$GITHUB_CUSTOM_GITCONFIG" \
      commit.gpgsign $GITHUB_GPG_SHOULD_SIGN

    # Include my not tracked custom gitconfig from my tracked one
    git config \
      --file="$MY_DOTTIES_DIR/gitconfig" \
      include.path $GITHUB_CUSTOM_GITCONFIG

  fi
}

# Extract Payload from inside of a pkg
function epackage () {
  pkgutil --expand "$1.pkg" "/tmp/$1"
  echo "Files extracted to: /tmp/$1"
}

# Extract Payload from inside of a pkg
function epayload () {
  # Two possible ways payloads could be compressed
  pbzx -n Payload
  if [ $? -eq 0 ]
  then
    pbzx -n Payload | cpio -i
  else
    cat Payload | gzip -d | cpio -id
  fi
  echo "Files extracted to current directory"
}

# Game Audio Create - Takes a wav file and creates both
# ogg and m4a leveraging ffmpeg
function gacreate () {
  ffmpeg -i "$1" -c:a libfdk_aac -b:a 128k "$(echo $1 | cut -f 1 -d '.').m4a"
  ffmpeg -i "$1" -c:a libvorbis -qscale:a 5 "$(echo $1 | cut -f 1 -d '.').ogg"
}

# Allows us to change node version based on project .nvmrc
function setnvm () {
 if [ "$PWD" != "$MYOLDPWD" ]; then
   MYOLDPWD="$PWD";
   if [ -e "$PWD/.nvmrc" ]; then
     nvm use
   fi
 fi
}

# Override cd to also run our nvm checker
function cd () {
  builtin cd "$@" && setnvm;
}

# -- Begin Prompt configuration --

# Returns $1 as the current branch
function getGitBranch {
  local fullRefsHead
  fullRefsHead=`git symbolic-ref HEAD 2> /dev/null`

  # If we were able to run the git command with success
  [[ $? == 0 ]] \
    && eval "$1='${fullRefsHead//refs\/heads\//}'" \
    || eval "$1=''";
}

# Returns the git status portion of the prompt in $3
function git_info () {
  local gitBranch
  getGitBranch gitBranch

  # Hotfix: Chromium repo is too big to check if dirty
  case `pwd` in
    # If the current folder we are in is part of `Chromium`
    # Use our function to determine branch w/out status
    (*Chromium/src*)
      eval "$3='[ ${1}${gitBranch}${2} ]'" \
      ;;
    # If current directory is initialized with git
    # Let our zsh command determine branch and status
    (*)
      [[ -n $gitBranch ]] \
        && eval "$3='[ ${1}${gitBranch}$(parse_git_dirty)${2} ]'" \
        || eval "$3=''"
      ;;
  esac
}

# Enable prompt substitution
setopt promptsubst

# Executed before each prompt print
function precmd () {
  # Set color variables
  local CB=$'%{$fg_bold[blue]%}'
  local CBB=$'%{$fg_bold[blue]%}'
  local CBG=$'%{$fg_bold[green]%}'
  local CW=$'%{$fg[white]%}'

  # Reset
  local RS=$'%{$reset_color%}'

  # Newline
  local NL=$'\n'

  # Datetime print
  local DT=$'%D{[%X]} '

  # Folder print
  local FP=$'[%3/] '

  # Git Prompt print
  local GP
  git_info $CBG $RS GP

  # Command Prompt
  local CP="${CB}->${CBB} %# ${RS}"

  # Main Prompt
  local MP="${CB}${DT}${RS}${GP}${NL}${CW}${FP}${NL}${CP}"

  # Set Prompt
  PS1="${MP}"
}

# Enable precmd functions
typeset -a precmd_functions

# Add a custom function to the list of precmd functions
#precmd_functions+=()

# -- End Prompt configuration --

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

# Edit nginx Servers
function nedit {
  cd /usr/local/etc/nginx/servers && \
  $VIM_PATH && \
  cd -
}

function nreload {
  brew services restart nginx-full
}

function nstart {
  brew services start nginx-full
}

function nstop {
  brew services stop nginx-full
}

function nluapkg {
  cd /usr/local/Cellar/luajit/2.0.4_3/share/luajit-2.0.4 && \
  $VIM_PATH && \
  cd -
}

function nluapkgb {
  cd /usr/local/Cellar/luajit/2.0.4_3/share/luajit-2.0.4
}

function nluapkgc {
  echo "/usr/local/Cellar/luajit/2.0.4_3/share/luajit-2.0.4" | pbcopy
}

function nconf {
  cd /usr/local/etc/nginx && \
  $VIM_PATH && \
  cd -
}

function nconfb {
  _l=`pwd`
  cd /usr/local/etc/nginx
}

function nconfc {
  echo "/usr/local/etc/nginx" | pbcopy
}

function nhome {
  cd /usr/local/Cellar/nginx-full/1.12.0 && \
  $VIM_PATH && \
  cd -
}

function nhomeb {
  _l=`pwd`
  cd /usr/local/Cellar/nginx-full/1.12.0
}

function nhomec {
  echo "/usr/local/Cellar/nginx-full/1.12.0" | pbcopy
}

function nlog {
  cd /usr/local/var/log/nginx && \
  $VIM_PATH && \
  cd -
}

function nlogb {
  _l=`pwd`
  cd /usr/local/var/log/nginx
}

function nlogc {
  echo "/usr/local/var/log/nginx" | pbcopy
}

function nwww {
  cd /usr/local/var/www && \
  $VIM_PATH && \
  cd -
}

function nwwwb {
  _l=`pwd`
  cd /usr/local/var/www
}

function nwwwc {
  echo "/usr/local/var/www" | pbcopy
}

# If dotties is installed then make some functions
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
    $VIM_PATH && \
    cd -
  }
  function dbrowse {
    _l=`pwd`
    cd $MY_DOTTIES_DIR
  }
fi
