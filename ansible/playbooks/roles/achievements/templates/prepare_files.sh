#!/bin/bash
chown -R {{ digitalocean_sudo_user }}:{{ digitalocean_sudo_user }} ./achievements-bundle

#
# GUI
#
mkdir -p /var/www/{{ app_host_name }}/html
mv ./achievements-bundle/gui/* /var/www/{{ app_host_name }}/html/
chown -R {{ digitalocean_sudo_user }}:{{ digitalocean_sudo_user }} /var/www/{{ app_host_name }}/html
chmod -R 0755 /var/www/{{ app_host_name }}/html
ln -s /etc/nginx/sites-available/{{ app_host_name }} /etc/nginx/sites-enabled/{{ app_host_name }}

#
# Backend service
#
mkdir -p /opt/achievements
mv ./achievements-bundle/server/* /opt/achievements/
sudo chown -R achievements:achievements /opt/achievements
chmod 0755 /opt/achievements/start.sh
