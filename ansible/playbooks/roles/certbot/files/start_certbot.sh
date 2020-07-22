#!/usr/bin/env bash
APP_HOST_NAME=$1
APP_SMTP_FROM=$2

# --redirect         Automatically redirect all HTTP traffic to HTTPS.
# --agree-tos        Agree to the ACME Subscriber Agreement.
# --email            Email used for registration and recovery contact.
# --no-eff-email     Don't share your e-mail address with EFF.
# --domains          Domain names to apply for (comma separated list). The first domain provided will be the subject CN of the certificate, and all domains will be Subject Alternative Names on the certificate.
# --reinstall        If the requested certificate matches an existing certificate, always keep the existing one until it is due for renewal (for the 'run' subcommand this means reinstall the existing certificate).
# Source: https://certbot.eff.org/docs/using.html#certbot-command-line-options
certbot \
  --nginx \
  --noninteractive \
  --redirect \
  --agree-tos \
  --email "$APP_SMTP_FROM" \
  --no-eff-email \
  --domains "$APP_HOST_NAME" \
  --reinstall

# TODO: Create backup of /etc/letsencrypt (where generated certificates and config is stored)