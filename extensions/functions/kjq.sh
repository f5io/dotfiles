function kjq
{
  local service=$1
  shift
  kubectl logs -f $service | grep "^{" | jq "$@" 
}

