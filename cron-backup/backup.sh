#!/bin/bash

filename=backup-$(date "+%y-%m-%d-%H-%M").tgz
echo "creating backup $filename" | tee -a ${LOG_LOCATION}

tar \
  --exclude="cache" \
  --exclude="logs" \
  --exclude="*.jar" \
  -zcf \
  /destination/$filename \
  -C /source .

chmod a+rw /destination/$filename

backups=$(ls -1q destination/*.tgz)
backup_count=$(ls -1q destination/*.tgz | wc -l)

if test $backup_count -gt $BACKUP_COUNT_LIMIT; then
  let COUNT=$(expr $backup_count - $BACKUP_COUNT_LIMIT - 1)

  for file in $(ls /destination | head -n $COUNT); do
    echo "pruning backup /destination/$file" | tee -a ${LOG_LOCATION}
    rm /destination/$file
  done
fi
