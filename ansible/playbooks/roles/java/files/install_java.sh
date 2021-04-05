#!/usr/bin/env bash

# Check if Java is already installed
dpkg -s openjdk-14-jre-headless &> /dev/null
if [ $? -ne 0 ]; then

    # No, Java is not installed. Install it now.
    apt -y -qq install openjdk-14-jre-headless

fi
