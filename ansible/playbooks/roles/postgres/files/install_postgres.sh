#!/usr/bin/env bash

# Check if Postgresql is already installed
dpkg -s postgresql-9.6 &> /dev/null
if [ $? -ne 0 ]; then

    add-apt-repository --yes "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -sc)-pgdg main"
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
    apt-get update

    # No, Postgresql is not installed. Install it now.
    apt -y -qq install postgresql-9.6

    echo "host    all             all             10.133.0.0/16            md5" >> /etc/postgresql/9.6/main/pg_hba.conf

    # Memory configuration as per https://www.enterprisedb.com/postgres-tutorials/how-tune-postgresql-memory
    cp --force /tmp/postgresql.conf /etc/postgresql/9.6/main/postgresql.conf
    chown postgres:postgres /etc/postgresql/9.6/main/postgresql.conf
    chmod 0644 /etc/postgresql/9.6/main/postgresql.conf
    rm /tmp/postgresql.conf

    sudo -u postgres /usr/lib/postgresql/9.6/bin/pg_ctl -D /var/lib/postgresql/9.6/main -l logfile start

fi
