#!/usr/bin/env bash

# Check if git is already installed
dpkg -s git &> /dev/null
if [ $? -ne 0 ]; then

    # TODO: Don't update the apt cache for every package installed!
    apt update

    # No, git is not installed. Install it now.
    apt -y -qq install git

fi
