#!/usr/bin/env bash
APP_HOST_NAME=$1
APP_SMTP_FROM=$2

certbot \
  --nginx \
  --noninteractive \
  --redirect \
  --agree-tos \
  --email "$APP_SMTP_FROM" \
  --no-eff-email \
  --domains "$APP_HOST_NAME"

# TODO: Create backup of /etc/letsencrypt (where generated certificates and config is stored)