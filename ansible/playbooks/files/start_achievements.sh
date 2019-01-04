#!/bin/bash

export PORT="{{ app_port }}"
export JDBC_DATABASE_URL="{{ app_jdbc_database_url }}"
export JDBC_DATABASE_USERNAME="{{ app_db_user_name }}"
export JDBC_DATABASE_PASSWORD="{{ app_db_user_pw }}"
export GOOGLE_CLIENT_ID="{{ app_google_client_id }}"
export GOOGLE_CLIENT_SECRET="{{ app_google_client_secret }}"
export MICROSOFT_CLIENT_ID="{{ app_microsoft_client_id }}"
export MICROSOFT_CLIENT_SECRET="{{ app_microsoft_client_secret }}"
export JWT_SIGNING_SECRET="{{ app_jwt_signing_secret }}"
export SMTP_HOST="{{ app_smtp_host }}"
export SMTP_PORT="{{ app_smtp_port }}"
export SMTP_USERNAME="{{ app_smtp_username }}"
export SMTP_PASSWORD="{{ app_smtp_password }}"
export SMTP_FROM="{{ app_smtp_from }}"
export SENTRY_DSN="{{ app_sentry_dsn }}"

nohup java -Ddw.serverApplicationHost=https://{{ app_host_name }} \
    -Ddw.guiApplicationHost=https://{{ app_host_name }} \
    -Dsentry.environment=production \
    -jar achievements-service.jar \
    server \
    achievements-config.yml >achievements-service.log 2>&1 &