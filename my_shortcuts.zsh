# -----------------------------------------------------
# Define a `GIT CLONE` hotkey shortcut
function clone_from_clip() {
  # Alter contents of input BUFFER
  BUFFER="git clone `pbpaste`"
  # Have zsh run command from BUFFER
  zle accept-line
}
# Create widget mapped to the function
zle -N clone_from_clip
# Bind widget to shortcut (hold ESC and c together)
# * Must have a git clone url on clipboard to work.
bindkey "^[c" clone_from_clip
# -----------------------------------------------------
