#!/bin/bash
function computer_move(){
    if [ $(($sticks%4)) -eq 4 ]; then
    echo 3
    else
    echo $(($sticks%4))
    fi
}
function display_sticks (){
    echo -e "number of sticks"
    for ((i=0; i < sticks; i++)); do echo -n "|"; done
}
list=("1 2 3")
under=20
up=25
sticks=0
while [ "$sticks" -le "$under" ]
do
sticks=$RANDOM
let "sticks %=$up"
done
while true; do
  display_sticks
  read -t 3 -p 'enter how many sticks you want to take(1,2 or 3) : ' move 
  if [ "$sticks" -eq "$move" ]; then
  echo "u win"
  break
  fi
  if [[ -z $move || ! "${list[*]}" =~ "${move}" || "$move" -gt "$sticks" ]]; then
    echo "computer win"
    break
  else
    sticks=$(($sticks - $move))
  fi
  sticks=$(( $sticks - $(computer_move) ))
  if [[ "$sticks" -eq "$computer_move" ]]; then
    echo "computer win"
    break
  fi
done
