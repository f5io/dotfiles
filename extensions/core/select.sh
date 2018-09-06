#!/bin/sh 

highlight=`tput setaf 0; tput setab 7`
reset=`tput sgr0`

get_selected() {
  local i=0
  for item in "${input[@]}"; do
    if [ "$item" = "$selected" ]; then selected_index=$i; fi
    let i=$i+1
  done
}

lockdown() {
  stty -echo # dont echo kb input
  tput civis # make cursor invisible
}

release() {
  stty echo # echo kb input
  tput cnorm # put cursor back to normal
}

restore() {
  tput cuu $input_length # move cursor up n
  tput ed # empty to end of screen
}

build_menu() {
  j=0
  out=""
  for item in "${input[@]}"; do
    if [ $j -eq $selected_index ]; then
      out="$out${highlight} > $item  ${reset}  \n"
    else
      out="$out  $item    \n"
    fi 
    let j=$j+1
  done
  echo -n "\r${out%??}"
}

maybe_prompt() {
  if [ -n "$prompt" ]; then
    echo "$prompt\n";
  fi
}

loop() {
  while [ 0 ]; do 
    if [ $selected_index -lt 0 ]; then selected_index=0; fi 
    if [ $selected_index -eq $input_length ]; then let selected_index=$selected_index-1; fi 

    build_menu

    read -sn 1 kb 
    case "$kb" in 
      "B"|"j") let selected_index=$selected_index+1;; 
      "A"|"k") let selected_index=$selected_index-1;; 
      "") break;; 
    esac 
    restore
  done 
  echo
  eval "export $1=\"${input[$selected_index]}\""
}

input_list=""
selected_index=0
selected=""
outvar=SELECT_RESULT

while [ "$1" != "" ]; do
  case $1 in
    -c|--choice) input_list="$input_list|$2"; shift;;
    -s|--selected) selected="$2"; shift;;
    -p|--prompt) prompt="$2"; shift;;
    -o|--out) outvar="$2"; shift;;
    *) break;;
  esac
  shift
done

IFS='|' read -a input <<< "${input_list##|}"
input_length="${#input[@]}"

lockdown
trap release 0

get_selected
maybe_prompt

loop $outvar


