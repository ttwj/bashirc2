#!/bin/bash
#Module loader for bashirc
if [ ! "$modules" ]; then
   modules=$(ls ../modules | grep '.sh')
fi
for module in $modules; do
   ../lib/libmodulengine.sh "$LINE" "$module"
done

