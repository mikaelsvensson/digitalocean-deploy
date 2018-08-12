#!/usr/bin/env bash

# Check if nginx is already installed
dpkg -s nginx &> /dev/null
if [ $? -ne 0 ]; then

    # No, nginx is not installed. Install it now.
    apt update
    apt -y -qq install nginx

    # Open port 80 and 443 in firewall
    ufw allow 'Nginx Full'

fi
