#!/usr/bin/env bash
APP_HOST_NAME=$1

A="mail.com"
B="minamarken"
C="@g"

certbot --nginx --noninteractive --redirect --agree-tos --email "$B$C$A" --no-eff-email --domains "$APP_HOST_NAME"
