#!/bin/sh

#users can see all jobs
qmgr -c "set server query_other_jobs = true"


# defining queues
qmgr -c "delete queue serial"
qmgr -c "delete queue parallel"
qmgr -c "delete queue cuda"
qmgr -c "delete queue longser"


# serial queue
qmgr -c "create queue serial queue_type=execution"
qmgr -c "set queue serial started=true"
qmgr -c "set queue serial enabled=true"
qmgr -c "set queue serial resources_default.ncpus=1"
qmgr -c "set queue serial resources_min.ncpus=1"
qmgr -c "set queue serial resources_max.ncpus=1"
qmgr -c "set queue serial resources_default.walltime=3600"
qmgr -c "set queue serial keep_completed=10"
qmgr -c "set queue serial resources_max.walltime = 72:00:00"

# parallel queue
qmgr -c "create queue parallel queue_type=execution"
qmgr -c "set queue parallel started=true"
qmgr -c "set queue parallel enabled=true"
qmgr -c "set queue parallel resources_default.ncpus=2"
qmgr -c "set queue parallel resources_min.ncpus=2"
qmgr -c "set queue parallel resources_max.ncpus=24"
qmgr -c "set queue parallel resources_default.walltime=3600"
qmgr -c "set queue parallel keep_completed=10"
qmgr -c "set queue parallel resources_max.walltime = 72:00:00"

# cuda queue
qmgr -c "create queue cuda queue_type=execution"
qmgr -c "set queue cuda started=true"
qmgr -c "set queue cuda enabled=true"
qmgr -c "set queue cuda resources_default.nodes=1"
qmgr -c "set queue cuda resources_max.nodes=1"
qmgr -c "set queue cuda resources_default.walltime=3600"
qmgr -c "set queue cuda keep_completed=10"
qmgr -c "set queue cuda max_running=4"
qmgr -c "set queue cuda resources_max.walltime = 72:00:00"

# long serial queue
qmgr -c "create queue longser queue_type=execution"
qmgr -c "set queue longser started=true"
qmgr -c "set queue longser enabled=true"
qmgr -c "set queue longser resources_default.ncpus=1"
qmgr -c "set queue longser resources_min.ncpus=1"
qmgr -c "set queue longser resources_max.ncpus=1"
qmgr -c "set queue longser resources_default.walltime=3600"
qmgr -c "set queue longser keep_completed=10"
qmgr -c "set queue longser resources_max.walltime =168:00:00"
qmgr -c "set queue longser acl_user_enable=true"
qmgr -c "set queue longser acl_users=ricky"


