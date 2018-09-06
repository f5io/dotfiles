#!/bin/bash
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
  echo -e "\r${out%??}"
}

maybe_prompt() {
  if [ -n "$prompt" ]; then
    echo -e "$prompt\n";
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

function n {
  if [ ! -e "package.json" ]; then
    echo "No package file!"
    exit 1;
  fi

  commands=$(npm run | sed -n '1!p' | tr '\n' '|')
  prompt="Which script would you like to run?"
  input_list=""
  selected_index=0
  outvar=SELECT_INPUT

  IFS="|" read -a cmds <<< "${commands}"
  
  let x=0
  for item in "${cmds[@]}"; do
    if [ $((x % 2)) -eq 0 ]; then
      if [ ! -z "$item" ]; then
        clean="$(echo $item | xargs)" 
        input_list="$input_list|$clean"
      fi
    fi
    let x=x+1
  done

  IFS='|' read -a input <<< "${input_list##|}"
  input_length="${#input[@]}"

  lockdown
  trap release 0

  maybe_prompt

  loop $outvar

  sh -c "npm run $SELECT_INPUT"
}

n
