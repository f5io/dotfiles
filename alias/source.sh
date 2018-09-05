#!/bin/sh

: ${DOTFILES:="$HOME/.dotfiles"}

base_dir="$DOTFILES/alias"

for b in $base_dir/basic/*; do
  bn=$(basename "$b")
  add="alias $bn=\"$(cat $b)\""
  echo "aliasing > $add"
  eval "$add"
done

for f in $base_dir/functions/*; do
  echo "sourcing > $f"
  . $f
done

for c in $base_dir/commands/*; do
  bn=$(basename "$c" .sh)
  chmod +x $c
  add="alias $bn=\"$c\""
  echo "aliasing > $add"
  eval "$add"
done
