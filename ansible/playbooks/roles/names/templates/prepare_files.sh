#!/bin/bash
mkdir -p /var/www/{{ names_host_name }}/html
cp -R ./names-bundle/gui/* /var/www/{{ names_host_name }}/html/
chown -R {{ digitalocean_sudo_user }}:{{ digitalocean_sudo_user }} /var/www/{{ names_host_name }}/html
chown -R {{ digitalocean_sudo_user }}:{{ digitalocean_sudo_user }} ./names-bundle
chmod -R 0755 /var/www/{{ names_host_name }}/html
chmod 0755 ./names-bundle/server/start.sh
ln -s /etc/nginx/sites-available/{{ names_host_name }} /etc/nginx/sites-enabled/{{ names_host_name }}
