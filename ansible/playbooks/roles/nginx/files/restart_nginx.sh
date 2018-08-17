#!/usr/bin/env bash

# Check if nginx is already installed
dpkg -s nginx &> /dev/null
if [ $? -eq 0 ]; then

    systemctl restart nginx

fi
