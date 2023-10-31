#!/bin/bash
 

create_backup() {
    timestamp=$(date +%Y%m%d%H%M)
    tar -zcvf /home/devopsuser/backup/backup_$timestamp.tar.gz /home/devopsuser/devopsdir
}
 

main() {
    
    create_backup
 
    
    cron_job="*/10 * * * * /path/to/backup.sh" #provide your own path
 
   
    (crontab -l; echo "$cron_job") | crontab -
}
 

main