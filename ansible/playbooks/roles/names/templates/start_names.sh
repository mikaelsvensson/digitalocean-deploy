#!/bin/bash

/usr/bin/java \
  -XX:+UnlockExperimentalVMOptions -XX:+UseZGC -XX:ZUncommitDelay=30 -Xlog:gc -Xms16M -Xmx192M \
  -jar names-service.jar > service.log 2>&1

# Documentation for ZGC (The Z Garbage Collector): https://wiki.openjdk.java.net/display/zgc/Main
