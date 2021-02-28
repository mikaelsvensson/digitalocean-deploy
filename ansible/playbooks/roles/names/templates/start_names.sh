#!/bin/bash
IS_BOOTING=$1
/usr/bin/java \
  -XX:+UnlockExperimentalVMOptions -XX:+UseZGC -XX:ZUncommitDelay=30 -Xlog:gc -Xms16M -Xmx192M \
  -jar names-service.jar \
  --spring.liquibase.enabled=$IS_BOOTING \
  --scbImporter.onStart=$IS_BOOTING \
  --ssaImporter.onStart=$IS_BOOTING \
  --ssbImporter.onStart=$IS_BOOTING \
  --dstImporter.onStart=$IS_BOOTING \
  --avoindataImporter.onStart=$IS_BOOTING \
  --syllableUpdater.onStart=$IS_BOOTING >> service.log 2>&1

# Documentation for ZGC (The Z Garbage Collector): https://wiki.openjdk.java.net/display/zgc/Main
