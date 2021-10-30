#!/bin/bash

function pushit {
  bnch=$(git branch | grep \* | cut -d ' ' -f2)
  git add . && git commit -m "$1" && git pull -r origin $bnch && git push -u origin $bnch
}
