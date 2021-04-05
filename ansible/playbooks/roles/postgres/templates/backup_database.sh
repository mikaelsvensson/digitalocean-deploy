#!/bin/bash
#
# Backup a Postgresql database into a daily file.
#
# Credits: https://gist.github.com/sirbrillig/4624937
#

BACKUP_DIR=/home/{{ digitalocean_sudo_user }}/database-backups
DAYS_TO_KEEP=14
DATABASE={{ item.db_name }}
SUFFIX=.sql
USER=postgres
TIMESTAMP=$(date +"%Y%m%d%H%M")
FILE="${DATABASE}_backup_${TIMESTAMP}${SUFFIX}"

OUTPUT_FILE=${BACKUP_DIR}/${FILE}

# do the database backup (dump)
# use this command for a database server on localhost. add other options if need be.
sudo -u postgres pg_dump -U ${USER} ${DATABASE} -F p -f /tmp/${FILE}
chmod 0644 /tmp/${FILE}
mv /tmp/${FILE} ${OUTPUT_FILE}

# gzip the database dump file
gzip -f $OUTPUT_FILE

chown {{ digitalocean_sudo_user }} ${OUTPUT_FILE}.gz

sudo aws s3 cp ${OUTPUT_FILE}.gz s3://mikaelsvensson.info-digitalocean.backup/${FILE}.gz

# prune old backups
find $BACKUP_DIR -maxdepth 1 -mtime +$DAYS_TO_KEEP -name "*${SUFFIX}.gz" -exec rm -rf '{}' ';'
