# Add binaries into the path
PATH=/opt/bin:$PATH
export PATH

alias vi='/opt/bin/vim'

# Source all files in ~/.dotfiles/source/
function src() {
  local file
  if [[ "$1" ]]; then
    echo "source $1"
    source "$HOME/.dotfiles/source/$1.sh"
  else
    echo "source files"
    for file in ~/.dotfiles/source/*; do
      source "$file"
    done
  fi
}

src
