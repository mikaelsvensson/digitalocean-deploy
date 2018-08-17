#!/usr/bin/env bash

# Check if nginx is already installed
dpkg -s nginx &> /dev/null
if [ $? -ne 0 ]; then

    # TODO: Don't update the apt cache for every package installed!
    apt update

    # No, nginx is not installed. Install it now.
    apt -y -qq install nginx

    # Open port 80 and 443 in firewall
    # TODO: Look into if better to use firewall from Digital Ocean instead.
    ufw allow 'Nginx Full'

fi
