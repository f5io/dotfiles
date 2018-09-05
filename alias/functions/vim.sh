#!/bin/bash

function vim {
  export VIM_PWD=${PWD##*/}
  if [ $# -gt 0 ]; then
    /usr/local/bin/vim "$@";
  else
    /usr/local/bin/vim
  fi
}
