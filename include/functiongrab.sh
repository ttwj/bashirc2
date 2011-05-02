#!/bin/bash
. $1 > /dev/null 2>&1
functions=$(declare -F | awk '{print $NF}')
for function in $functions; do
   #remove the not-module function
   #loli[module]() {
   #}
   if [[ ! "$function" =~ (.*)'[module]' ]]; then
      unset -f "$function"
   fi
   declare -f
done
