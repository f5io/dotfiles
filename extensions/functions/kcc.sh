function kcc {
  echo "⎈ `kubectl config current-context | sed -n -e 's/.*\(paybase-\([a-z]*\)\).*/\1/p'`"
}
