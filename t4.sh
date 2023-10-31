#!/bin/bash

path="Bash/devopsdir"
mkdir -p "$path"
echo "AoA, Hello DevOps!" > "$path/devopsfile.txt"
chmod u+rw "$path/devopsfile.txt"
chmod u+rwx "$path"
chmod o+r "$path/devopsfile.txt"
 