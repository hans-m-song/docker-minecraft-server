echo "sleeping for ${STARTUP_DELAY}"
sleep ${STARTUP_DELAY}

echo "running first time backup"
/backup.sh

echo "starting cron"
cron

echo "tailing logs /var/log/cron.log"
tail -f /var/log/cron.log
