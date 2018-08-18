#!/usr/bin/env bash

# Check if Java is already installed
dpkg -s default-jre &> /dev/null
if [ $? -ne 0 ]; then

    # TODO: Don't update the apt cache for every package installed!
    apt update

    # No, Java is not installed. Install it now.
    apt -y -qq install default-jre

fi
