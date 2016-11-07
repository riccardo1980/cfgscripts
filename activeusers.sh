#!/bin/bash
ACTIVES=$( ps aux |  tail -n +2 | awk ' { print $1 }' | sort | uniq )

echo -e "USER\t\tTHREADS"
for UU in $ACTIVES
do
	NTHREADS=$( ps h -H -U $UU  | wc -l )
	echo -e "$UU\t\t$NTHREADS"
done
