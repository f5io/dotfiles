function kcc {
  local prefix="⎈"
  local cc=`kubectl config current-context`
  if [ "$cc" = "minikube" ]; then
    echo "$prefix $cc"
  else
    echo "$prefix `echo \"$cc\" | sed -n -e 's/.*paybase-\([a-z]*\).*/\1/p'`"
  fi
}
