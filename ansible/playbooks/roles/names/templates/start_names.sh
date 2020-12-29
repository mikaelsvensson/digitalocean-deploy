#!/bin/bash

/usr/bin/java \
  -XX:+UnlockExperimentalVMOptions -XX:+UseZGC -Xmx300M -Xlog:gc \
  -jar names-service.jar > service.log 2>&1

# Documentation for ZGC (The Z Garbage Collector): https://wiki.openjdk.java.net/display/zgc/Main
