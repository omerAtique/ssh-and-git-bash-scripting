#!/bin/bash
 

create_users() {
  pattern="cs423_devops_user"
  password="YourPasswordHere"  
  count=1
 
  while [ $count -le 5 ]; do
    username="${pattern}_${count}"
    useradd -m -s /bin/bash "$username"
    echo "$username:$password" | chpasswd
    count=$((count + 1))
  done
}
 

create_groups_and_assign_users() {
  groups=("fcse" "fee" "fes" "fme" "fcve")
  count=1
 
  for group in "${groups[@]}"; do
    username="cs423_devops_user_$count"
    groupadd "$group"
    usermod -a -G "$group" "$username"
    count=$((count + 1))
  done
}
 

delegate_sudo_access() {
  username="cs423_devops_user_2"
  echo "$username ALL=NOPASSWD:/sbin/reboot" | sudo tee /etc/sudoers.d/reboot_user
}
 

grant_admin_privileges() {
  username="cs423_devops_user_1"
  usermod -aG sudo "$username"
}
 

generate_ssh_key_pairs() {
  pattern="cs423_devops_user"
  count=1
 
  while [ $count -le 5 ]; do
    username="${pattern}_${count}"
    ssh-keygen -t rsa -b 4096 -f "/home/$username/.ssh/$username" -N ""
    count=$((count + 1))
  done
}
 

configure_ssh_connection() {
  pattern="cs423_devops_user"
  count=1
 
  while [ $count -le 5 ]; do
    username="${pattern}_${count}"
    cat <<EOF > "/home/$username/.ssh/config"
Host $username
  HostName your_remote_server_address
  User $username
  IdentityFile ~/.ssh/$username
EOF
    count=$((count + 1))
  done
}
 

attach_public_key() {
  pattern="cs423_devops_user"
  count=1
 
  while [ $count -le 5 ]; do
    username="${pattern}_${count}"
    cat "/path/to/your/public/key.pub" >> "/home/$username/.ssh/authorized_keys"
    count=$((count + 1))
  done
}
 

configure_ssh_ports() {
  
  sudo sed -i 's/^#Port 22/Port 22/' /etc/ssh/sshd_config
  echo "Port 25" | sudo tee -a /etc/ssh/sshd_config
  
  sudo service ssh restart
}
 
main() {
  create_users
  create_groups_and_assign_users
  delegate_sudo_access
  grant_admin_privileges
  generate_ssh_key_pairs
  configure_ssh_connection
  attach_public_key
  configure_ssh_ports
}
 

main