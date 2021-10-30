function kcc {
  local prefix="⎈"
  local cc=`kubectl config current-context`
  case "$cc" in
    *paybase*)
      echo "$prefix `echo \"$cc\" | sed -n -e 's/.*paybase-\([a-z]*\).*/\1/p'`"
      ;;
    *)
      echo "$prefix $cc"
      ;;
  esac
}
