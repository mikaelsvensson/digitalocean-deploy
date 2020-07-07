#!/bin/bash
mkdir -p /var/www/{{app_host_name}}/html
cp -R ./achievements-bundle/gui/* /var/www/{{app_host_name}}/html/
chown -R {{ digitalocean_sudo_user }}:{{ digitalocean_sudo_user }} /var/www/{{app_host_name}}/html
chmod -R 0755 /var/www
ln -s /etc/nginx/sites-available/{{app_host_name}} /etc/nginx/sites-enabled/
