#!/bin/bash
# getlist.sh usr
# returns a list of pids of processes owned by usr
#
# getlist.sh usr cmd
# returns a list of pids of processes running cmd owned by usr
# 

if [ $# -eq 1 ]
then
	USR=$1
	ps --no-header -u $USR -o pid 
fi
if [ $# -eq 2 ]
then
	USR=$1
	CMD=$2
	ps --no-header -u $USR -o pid,cmd | grep $CMD | awk '{ print $1 }'
fi

