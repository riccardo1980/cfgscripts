
USER=brtgrl
EXE=lenstool
LOGFILE="/home/ricky/qcheck_run"
echo -n "$(date +"%h %Y-%m-%d %H:%M")" >> ${LOGFILE}

QENTRY=$(qstat | grep ${USER})
if [ -z "$QENTRY" ]; then
	PIDS=$( ps -o pid,uname -C ${EXE}| grep ${USER} | head -n +2 | awk '{ print $1}')
	if [ -n "$PIDS" ]; then 
		for ii in $PIDS
		do
			kill -9 $ii
		done
		echo " killed" >> ${LOGFILE}
	else
		echo " no killed" >> ${LOGFILE}
	fi
fi

