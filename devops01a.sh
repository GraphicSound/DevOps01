#!/bin/bash

VOLUMENUMBER="$(df -lh)"

echo "$VOLUMENUMBER"

#line="$(echo $VOLUMENUMBER | wc -w)"

#let $line-1

#printf "You have %s volumes. " "$line"

printf "CPU number: %s\n" "$(sysctl -n hw.physicalcpu)"

printf "RAM size: %s bytes\n" "$(sysctl hw.memsize)"

printf "%s\n" "$(networksetup -listallhardwareports | egrep -A 2 "(AirPort|Wi-Fi)" | grep Ethernet)"

printf "IP: %s\n" "$(ifconfig en0 | grep inet | grep -v inet6 | awk '{print $2}')"
