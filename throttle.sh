#!/bin/bash


reqPolicy=${1:-performance}

case "$reqPolicy" in
performance | ondemand )
;;
*)
	echo "GOVERNOR: performance | ondemand "
	exit -1
esac

policy=$( cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor )
Ntot=$( ls /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor | wc -l )
echo "Cores: " $Ntot
echo "Previous policy: " $policy
echo "Setting to: " $reqPolicy

N=0
while [ $N -lt $Ntot ]; do
	out=$( cpufreq-selector -c $N -g $reqPolicy 2>&1 )
	if [ "$out" != "" ]; then
		echo "An error occurred, cpufreq-selector says: "
		echo $out
		exit -1	
	fi	
	N=$(( $N+1 ))
done
