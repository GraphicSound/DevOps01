#!/bin/bash

if [ $# -eq 0 ]; then
	echo "
	-volumes
	if this command line parameter is found, display the same volume information you did in devops01a.sh

	-cpu
	if this command line parameter is found, display the same cpu/core information you did in devops01a.sh

	-ram
	if this command line parameter is found, display the same ram information you did in devops01a.sh

	-network
	if this command line parameter is found, display the same mac and ip address information you did in devops01a.sh

	-all
	display information for all command line options
		"
else
	for var in "$@"
	do
		if [ $1 == "-volumes" ]; then
			df -lh
		elif [ $1 == "-cpu" ]; then
			printf "cpu number: %s\n" "$(sysctl -n hw.physicalcpu)"
		elif [ $1 == "-ram" ]; then
			printf "ram size: %s bytes\n" "$(sysctl hw.memsize)"
		elif [ $1 == "-network" ]; then
			printf "%s\n" "$(networksetup -listallhardwareports | egrep -A 2 "(AirPort|Wi-Fi)" | grep Ethernet)"
			printf "ip: %s\n" "$(ifconfig en0 | grep inet | grep -v inet6 | awk '{print $2}')"
		elif [ $1 == "-all" ]; then
			df -lh
			printf "cpu number: %s\n" "$(sysctl -n hw.physicalcpu)"
			printf "ram size: %s bytes\n" "$(sysctl hw.memsize)"
			printf "%s\n" "$(networksetup -listallhardwareports | egrep -A 2 "(AirPort|Wi-Fi)" | grep Ethernet)"
			printf "ip: %s\n" "$(ifconfig en0 | grep inet | grep -v inet6 | awk '{print $2}')"
		fi
		shift;
	done
fi

#LINE="$(ECHO $VOLUMENUMBER | WC -W)"

#LET $LINE-1

#PRINTF "YOU HAVE %S VOLUMES. " "$LINE"

