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
  if [ "$force" != "1" ] && [ "$?" == "0" ]; then
    echo "$d is already installed"
  else
    echo "running: $install"
    sh -c "$install"
  fi 
}
