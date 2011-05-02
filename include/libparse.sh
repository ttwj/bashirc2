#!/bin/bash
#Parsing library for bashIRC
function value() {
derp=${@}
    echo "$1=\"${derp#* }\"" >> /tmp/bashIRC/share
}
function get.Sender() {
    if [[ "$LINE" =~ :(.*)!(.*)@(.*) ]]; then
        value 'nick' "${BASH_REMATCH[1]}"
        value 'user' "${BASH_REMATCH[2]}"
        value 'host' "${BASH_REMATCH[3]}"
        return 0
    else
        return 1
    fi
}
function get.Dest() {
dest=$(echo "$LINE" | cut -d ' ' -f3)
value 'dest' "$dest"
if [ ! "$(echo $dest | cut -d '#' -f1)" ]; then
value 'dest_chan' 'true'
fi
}
function get.Command() {
cmd=$(echo "$LINE" | cut -d ' ' -f4)
value 'command' "$cmd"
}
function get.Privmsg() {
if [ "$cmd" = "PRIVMSG" ]; then
if [[ "$LINE" =~ :(.*)' ':(.*) ]]; then
value 'text' "${BASH_REMATCH[2]}"
fi
}