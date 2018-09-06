#!/bin/sh 
CONTEXTS=`kubectl config view | grep -e "^- name: " | sed -n -e 's/- name: \(.*\)/\1/p'`
CURRENT=`kubectl config current-context`

i=0;
while read -r line; do
  let i=$i+1
  menu[$i]="$line"
  if [ "$line" = "$CURRENT" ]; then c=$i; fi
done <<< "$CONTEXTS"
i=$c 

highlight=`tput setaf 0; tput setab 7`
reset=`tput sgr0`

lockdown() {
  stty -echo # dont echo kb input
  tput civis # make cursor invisible
}

release() {
  stty echo # echo kb input
  tput cnorm # put cursor back to normal
}

restore() {
  tput cuu $j # move cursor up n
  tput ed # empty to end of screen
}

build_menu() {
  j=0
  out=""
  for item in "${menu[@]}"; do
    let j=$j+1
    if [ $j -eq $i ]; then
      out="$out${highlight} > $item  ${reset}  \n"
    else
      out="$out  $item    \n"
    fi 
  done
  echo -n "\r${out%??}"
}


echo "\nPlease select a context:\n" 

lockdown
trap release 0
while [ 0 ]; do 
  if [ $i -eq 0 ]; then i=1; fi 
  if [ ! "${menu[$i]}" ]; then let i=i-1; fi 
  
  build_menu

  read -sn 1 input 
  case "$input" in 
    "B"|"j") let i=$i+1;; 
    "A"|"k") let i=$i-1;; 
    "") break;; 
  esac 
  restore
done 
echo
CTX="${menu[$i]}"
kubectl config use-context $CTX
