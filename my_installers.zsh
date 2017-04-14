# If we detect YouCompleteMe is installed
if [[ -d $HOME/.vim/plugged/YouCompleteMe ]]; then
  # YouCompleteMe Setup if not compiled and on mac
  [[ "$(uname)" == "Darwin" ]] \
    && [[ ! -f $HOME/.vim/plugged/YouCompleteMe/third_party/ycmd/ycm_core.so ]] \
    && xcode-select --install

  [[ "$(uname)" == "Darwin" ]] \
    && [[ ! -f $HOME/.vim/plugged/YouCompleteMe/third_party/ycmd/ycm_core.so ]] \
    && cd "$HOME/.vim/plugged/YouCompleteMe" \
    && xcode-select --install \
    && ./install.py --all --system-libclang \
    && cd -
fi
