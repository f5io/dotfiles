#!/bin/sh

. $DOTFILES/utils.sh

base_dir="$DOTFILES/extensions"

for b in $base_dir/basic/*; do
  bn=$(basename "$b")
  add="alias $bn=\"$(cat $b)\""
  log "aliasing > $add"
  eval "$add"
done

for f in $base_dir/functions/*; do
  log "sourcing > $f"
  . $f
done

for c in $base_dir/commands/*; do
  bn=$(basename "$c" .sh)
  chmod +x $c
  add="alias $bn=\"$c\""
  log "aliasing > $add"
  eval "$add"
done
