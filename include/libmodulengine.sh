#!/bin/bash
#Module engine :O
source /tmp/bashIRC/share
e.hook 'chanMsg->#chat'
function e.hook() {
   #e.hook is revolutionary :D
   #penis[hook->chanMsg]() {
   # if [[ "$text" == *penis* ]]; then
   # msg $dest "sup penis."
   # fi
   #}
   #please mind my shitty usage of brackets :{
   #i'm addicted to C syntax :}
   #get all the functions
   #thanks gnu.org reference!
   functions=$(declare -F | awk '{print $NF}' | grep '\[hook->.*\]')
   for function in $functions; do
      {
         if [[ "$function" =~ (.*)'[hook->'(.*)']' ]]; then
            event=${BASH_REMATCH[2]}
            func=${BASH_REMATCH[1]}
         
         case "${event,,}" in
            "chanmsg" ) {
                  if [ "$dest_chan" = "true" ] && [ "$text" ]; then
                     $event
                  fi
            };;
            "privmsg" ) {
                  if [ "$dest_chan" = "false" ] && [ "$text" ]; then
                     $event
                  fi
            };;
            "channotice") {
                  
               }
         esac
      }
   }
done


