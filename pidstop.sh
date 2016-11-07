#!/bin/bash
if [ $# -ne 1 ]
then
	echo "provide a pid list file"
fi

while read pp
do 
	kill -STOP $pp
	
done < $1
