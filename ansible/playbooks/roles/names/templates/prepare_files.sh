#!/bin/bash
chown -R {{ digitalocean_sudo_user }}:{{ digitalocean_sudo_user }} ./names-bundle

#
# GUI
#
mkdir -p /var/www/{{ names_host_name }}/html
mv ./names-bundle/gui/* /var/www/{{ names_host_name }}/html/
chown -R {{ digitalocean_sudo_user }}:{{ digitalocean_sudo_user }} /var/www/{{ names_host_name }}/html
chmod -R 0755 /var/www/{{ names_host_name }}/html
ln -s /etc/nginx/sites-available/{{ names_host_name }} /etc/nginx/sites-enabled/{{ names_host_name }}

#
# Backend service
#
mkdir -p /opt/names
mv ./names-bundle/server/* /opt/names/
sudo chown -R names:names /opt/names
chmod 0755 /opt/names/start.sh
