#!/bin/bash
#Module engine :O
source /tmp/bashIRC/share
e.hook 'chanMsg->#chat'
function e.hook() {
#e.hook 'EVENT' 'function'
event=$(echo "$1" | sed -e 's/->//' | 
args=$(echo "$event" | cut -d ' ' -f2)
event=$(echo "$event" | cut -d ' ' -f1)
case "${event,,}" in
"chanmsg" ) { 
if [ "$dest_chan" = "true" ]; then
}
}
