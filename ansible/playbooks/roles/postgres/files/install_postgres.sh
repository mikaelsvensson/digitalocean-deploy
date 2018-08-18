#!/usr/bin/env bash

# Check if Postgresql is already installed
dpkg -s postgresql-9.6 &> /dev/null
if [ $? -ne 0 ]; then

    add-apt-repository "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -sc)-pgdg main"
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
    # TODO: Don't update the apt cache for every package installed!
    apt-get update

    # No, Postgresql is not installed. Install it now.
    apt -y -qq install postgresql-9.6

    sudo -u postgres /usr/lib/postgresql/9.6/bin/pg_ctl -D /var/lib/postgresql/9.6/main -l logfile start

    sudo -u postgres psql postgres -f /tmp/init_app_database.sql

fi
