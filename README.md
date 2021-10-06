# docker-minecraft-server

server with automated backups using cron

- mc-server - server instance
- mc-backup - backup sidecar that saves data from `/data` into tar archives

in the event of data loss, use `restore.sh` to restore data from the most recent archive into the volume, then start the containers again
