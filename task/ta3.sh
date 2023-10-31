#!/bin/bash
 

update_package_inventory() {
  mkdir -p ~/task4
  sudo apt update > ~/task4/task4-1.txt
}
 

display_package_version() {
  package_name="$1"
  output_file="$2"
 
  package_version=$(dpkg -l | grep "ii  $package_name" | awk '{print $3}')
  echo "Version of $package_name: $package_version" > "$output_file"
}
 

upgrade_nano_editor() {
  sudo apt upgrade nano -y
}
 

install_wordpress_dependencies() {
  
  sudo apt install apache2 -y
 
  
  sudo apt install php7.4 -y
 
  
  sudo apt install mysql-server -y
 
 
  apache_doc_root=$(grep -r "DocumentRoot" /etc/apache2/sites-available/000-default.conf | awk '{print $2}')
  echo "Apache Document Root: $apache_doc_root"
 
  
  sudo wget -O /var/www/html/adminer.php https://www.adminer.org/latest.php
 
 
  sudo systemctl restart apache2
}
 

main() {
  update_package_inventory
  display_package_version "nano" ~/task4/task4-2.txt
  upgrade_nano_editor
  install_wordpress_dependencies
}
 

main