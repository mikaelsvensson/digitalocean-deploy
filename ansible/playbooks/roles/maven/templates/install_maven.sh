#!/usr/bin/env bash

# Check if maven is already installed
dpkg -s maven &> /dev/null
if [ $? -ne 0 ]; then

    # TODO: Don't update the apt cache for every package installed!
    apt update

    # No, maven is not installed. Install it now.
    apt -y -qq install maven

fi
