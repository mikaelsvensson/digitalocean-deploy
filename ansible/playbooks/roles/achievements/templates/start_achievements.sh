#!/bin/bash

PORT={{ app_port }} \
PORT_TEST={{ app_port }} \
JDBC_DATABASE_URL="{{ app_jdbc_database_url }}" \
JDBC_DATABASE_USERNAME={{ app_db_user_name }} \
JDBC_DATABASE_PASSWORD="{{ app_db_user_pw }}" \
GOOGLE_CLIENT_ID={{ app_google_client_id }} \
GOOGLE_CLIENT_SECRET="{{ app_google_client_secret }}" \
MICROSOFT_CLIENT_ID={{ app_microsoft_client_id }} \
MICROSOFT_CLIENT_SECRET="{{ app_microsoft_client_secret }}" \
JWT_SIGNING_SECRET="{{ app_jwt_signing_secret }}" \
SMTP_HOST={{ app_smtp_host }} \
SMTP_PORT={{ app_smtp_port }} \
SMTP_USERNAME={{ app_smtp_username }} \
SMTP_PASSWORD="{{ app_smtp_password }}" \
SMTP_FROM="{{ app_smtp_from }}" \
SENTRY_DSN="{{ app_sentry_dsn }}" \
BASE_URI_SERVER="https://{{ app_host_name }}" \
BASE_URI_GUI="https://{{ app_host_name }}" \
/usr/bin/java \
    -XX:+UnlockExperimentalVMOptions -XX:+UseZGC -Xmx300M -Xlog:gc \
  -Dsentry.environment=production \
  -jar achievements-service.jar \
  server config.yml > service.log 2>&1

# Documentation for ZGC (The Z Garbage Collector): https://wiki.openjdk.java.net/display/zgc/Main
