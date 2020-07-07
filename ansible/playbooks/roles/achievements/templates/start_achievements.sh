#!/bin/bash

nohup java -Ddw.serverApplicationHost=https://{{ app_host_name }} \
    -Ddw.guiApplicationHost=https://{{ app_host_name }} \
    -Dsentry.environment=production \
    -jar achievements-service.jar \
    server \
    config.yml >service.log 2>&1 &