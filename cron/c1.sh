#!/bin/bash
 

create_user() {
    sudo useradd devopsuser -m -s /bin/bash
}
 
create_group() {
    sudo groupadd devopsgroup
}
 

add_user_to_group() {
    sudo usermod -a -G devopsgroup devopsuser
}
 

main() {
    create_user
    create_group
    add_user_to_group
 
    # give file paths
    (crontab -l; echo "0 2 * * * /path/to/usergroup.sh") | crontab -
    (crontab -l; echo "15 2 * * * /path/to/usergroup.sh") | crontab -
    (crontab -l; echo "30 2 * * * /path/to/usergroup.sh") | crontab -
}
 

main