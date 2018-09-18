#!/usr/bin/env bash

add-apt-repository -y ppa:certbot/certbot
apt -y -qq install python-certbot-nginx