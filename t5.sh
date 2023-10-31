#!/bin/bash
source_dir="/path/to/devopsdir"
backup_dir="/home/devopsuser/backup"

mkdir -p "$backup_dir"

backup_filename="backup_$(date +'%Y%m%d_%H%M%S').tar.gz"

tar -czf "$backup_dir/$backup_filename" "$source_dir"

echo "Backup completed: $backup_filename"
 
