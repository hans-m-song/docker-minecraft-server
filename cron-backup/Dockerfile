FROM ubuntu:20.04

RUN apt update && apt install -y cron
RUN touch /var/log/cron.log

ARG BACKUP_CRONTAB="0 0 * * *"
RUN echo "${BACKUP_CRONTAB} /backup.sh" > /etc/cron.d/backup-cron \
  && chmod 0644 /etc/cron.d/backup-cron \
  && crontab /etc/cron.d/backup-cron

COPY backup.sh start.sh /

ARG BACKUP_COUNT_LIMIT=5
ENV BACKUP_COUNT_LIMIT=${BACKUP_COUNT_LIMIT}
ARG STARTUP_DELAY=15s
ENV STARTUP_DELAY=${STARTUP_DELAY}

CMD /start.sh
