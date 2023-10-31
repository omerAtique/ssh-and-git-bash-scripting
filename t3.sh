#!/bin/bash


username="Fall2023"
user_directory="/home/$username/CS423/test"

mkdir -p $user_directory


chown -R $username:$username $user_directory

echo "Directory structure $user_directory created successfully."


ssh-keygen -t rsa -f /home/$username/.ssh/id_rsa -N ""


sudo sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
echo "IdentityFile /home/$username/.ssh/id_rsa" >> /home/$username/.ssh/config
echo "IdentitiesOnly yes" >> /home/$username/.ssh/config
sudo service ssh restart

if sudo service ssh status | grep "active (running)"; then
    
    ssh -o StrictHostKeyChecking=no -i /home/$username/.ssh/id_rsa localhost "mkdir -p $user_directory && echo 'I am doing the task2.' > $user_directory/filecreatedinnoninteractivemode.txt"
    echo "SSH Configuration and tasks have been completed successfully."
else
    echo "SSH service is not running. Please check the SSH configuration."
fi
