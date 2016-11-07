#!/bin/sh
if [ $# -ne 1 ]
 then
	echo Must provide a user name
	exit -1
fi

USER=$1
echo "bad gui: $USER"
for ii in $( ps --no-headers -u $USER -o pid ); 
	do renice 20 -p $ii; 
	ionice -n 7 -c 3 -p $ii; 
	ionice -p $ii; 
done
