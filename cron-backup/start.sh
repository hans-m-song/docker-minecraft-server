echo "sleeping for ${STARTUP_DELAY}"
sleep ${STARTUP_DELAY}

echo "running first time backup"
/backup.sh

echo "starting cron"
cron

echo "tailing logs ${LOG_LOCATION}"
touch ${LOG_LOCATION}
tail -f ${LOG_LOCATION}
