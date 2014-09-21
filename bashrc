# Add binaries into the path
PATH=/opt/bin:$PATH
export PATH

alias vi='/opt/bin/vim'

# Source all files in ~/.dotfiles/source/
function src() {
  local file
  if [[ "$1" ]]; then
    source "$HOME/.dotfiles/source/$1.sh"
  else
    for file in ~/.dotfiles/source/*; do
      source "$file"
    done
  fi
}
