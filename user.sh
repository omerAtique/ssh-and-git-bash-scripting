#!/bin/bash


if id "devopsuser" &>/dev/null; then
    echo "User 'devopsuser' already exists."
else
    sudo useradd devopsuser
    echo "User 'devopsuser' created."
fi


if getent group "devopsgroup" &>/dev/null; then
    echo "Group 'devopsgroup' already exists."
else
    sudo groupadd devopsgroup
    echo "Group 'devopsgroup' created."
fi


if groups "devopsuser" | grep -q "devopsgroup"; then
    echo "User 'devopsuser' is already a member of 'devopsgroup'."
else
    sudo usermod -aG devopsgroup devopsuser
    echo "User 'devopsuser' added to 'devopsgroup'."
fi
