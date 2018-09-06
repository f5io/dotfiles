export DOTFILES=${DOTFILES:-"$HOME/.dotfiles"}

function log {
  [[ $DOTFILES_LOG_LEVEL == 1 ]] && echo "$@"
}

function init_submodules {
  git submodule update --init
  git submodule foreach -q --recursive 'branch=$(git config -f $toplevel/.gitmodules submodule.$name.branch); git checkout $branch'
}

function setup_brew {
  ln -sf $DOTFILES/.brew/bin/brew /usr/local/bin/brew
}

function symlink_exists {
  [ -L "$1" ] && [ -e "$1" ]
}

function link {
  if ! symlink_exists "$HOME/$1"; then
    ln -sf $DOTFILES/$1 $HOME/$1
  fi
}

function dep {
  local d=""
  local install=""
  local force=0

  while [ "$1" != "" ]; do
    case $1 in
      -b|--brew) 
        d="$2"
        install="HOMEBREW_NO_AUTO_UPDATE=1 brew install $d"
        shift;;
      -i|--install)
        install="$2"
        shift;;
      -f|--force)
        force=1
        ;;
      *) 
        d="$1"
        ;;
    esac
    shift
  done
  
  type $d &> /dev/null
  exist=$?
  if [ $force == 1 ] || [ $exist == 1 ]; then
    echo "running: $install"
    sh -c "$install"
  else
    echo "$d is already installed"
  fi 
}
