#!/bin/bash


ssh-keygen -t rsa -f ~/.ssh/id_rsa


echo "PasswordAuthentication no" | sudo tee -a /etc/ssh/sshd_config
sudo systemctl restart ssh


Host myserver
  HostName server_ip_or_hostname
  User devopsuser
  IdentityFile ~/.ssh/id_rsa
EOF


cp ~/.ssh/id_rsa /home/devopsuser/.ssh/id_rsa
chown devopsuser:devopsgroup /home/devopsuser/.ssh/id_rsa
chmod 600 /home/devopsuser/.ssh/id_rsa


ssh myserver <<EOF
  # Create a test directory inside the home directory
  mkdir ~/test_directory

  # Create a file and write "I am doing the task2."
  echo 'I am doing the task2.' > ~/test_directory/filecreatedinnoninteractivemode.txt
EOF


ssh myserver "chown -R devopsuser:devopsgroup ~/test_directory"
ssh myserver "chmod -R 755 ~/test_directory"
