function kf
{
  local found=$(kubectl get pods --all-namespaces=true -o custom-columns=NAME:.metadata.name,NAMESPACE:.metadata.namespace | grep "$1" | head -1)
  local name=$(echo "$found" | cut -d" " -f1)
  local namespace=$(echo "$found" | sed -E 's/(.*)[[:space:]]+(.*)/\2/')
  if [[ $namespace != "default" ]]; then
    echo "-n $namespace $name"
  else
    echo "$name"
  fi
}
