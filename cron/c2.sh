#!/bin/bash
 

generate_ssh_key() {
    ssh-keygen -t rsa -b 4096 -f /home/devopsuser/.ssh/id_rsa -N ""
}
 

configure_ssh_password_auth() {
    sudo sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
    sudo service ssh restart
}
 

set_up_ssh_for_easy_login() {
    echo "Host *" > /home/devopsuser/.ssh/config
    echo "   User devopsuser" >> /home/devopsuser/.ssh/config
    echo "   Hostname your_server_ip" >> /home/devopsuser/.ssh/config
}
 

main() {
    generate_ssh_key
    configure_ssh_password_auth
    set_up_ssh_for_easy_login
 
    # provide path to the file 
    (crontab -l; echo "0 3 * * * /path/to/sshconfig.sh") | crontab -
    (crontab -l; echo "15 3 * * * /path/to/sshconfig.sh") | crontab -
    (crontab -l; echo "30 3 * * * /path/to/sshconfig.sh") | crontab -
}
 

main