#!/bin/bash
WTMP=$( last | tail -n 1 )
WTMP_YYYY=$( echo $WTMP | awk '{ print $7}' )
WTMP_MM=$( echo $WTMP | awk '{ print $4}' )
WTMP_DD=$( echo $WTMP | awk '{ print $5}' )
WTMP_HMS=$( echo $WTMP | awk '{ print $6}' )

echo -e "Log starts at $WTMP_HMS $WTMP_DD $WTMP_MM $WTMP_YYYY\n"

USERS=$( last | head -n-2 | sort | uniq -w 10 | awk ' {print $1}'  )

for UU in $USERS
do
  last | grep $UU | head -n1 
done

