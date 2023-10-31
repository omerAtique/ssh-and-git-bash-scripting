#!/bin/bash

registration_number="Your_Reg_No"

scripts_dir="/path/to/scripts/directory"

tarball_name="${registration_number}.tar.gz"
 

tar -czf "$tarball_name" "$scripts_dir"/*.sh

server_ip="12.0.0..o0"
username="222111"
password="111222"
 

scp "$tarball_name" "$username@$server_ip:/home/"

rm "$tarball_name"