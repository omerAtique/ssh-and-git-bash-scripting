#!/bin/bash
 
create_faculty_directories() {
  faculties=("fcse" "fee" "fes" "fme" "fcve")
  for faculty in "${faculties[@]}"; do
    sudo mkdir -p "/$faculty"
  done
}
 
set_permissions_and_ownership() {
  faculties=("fcse" "fee" "fes" "fme" "fcve")
  for faculty in "${faculties[@]}"; do
    group_name="$faculty"

    sudo chown :"$group_name" "/$faculty"
    sudo chmod 770 "/$faculty"
   
    sudo setfacl -m g:"$group_name":rx /fc*
  done
  
  third_user="third_user_username"
  sudo setfacl -m u:"$third_user":r /fcve
}
 

create_files_in_faculty_directories() {
  faculties=("fcse" "fee" "fes" "fme" "fcve")
  for faculty in "${faculties[@]}"; do
    sudo touch "/$faculty/test_file.txt"
  done
}
 

search_for_test_files() {
  faculties=("fcse" "fee" "fes" "fme" "fcve")
  for faculty in "${faculties[@]}"; do
    sudo find "/$faculty" -type f -name "test_file.txt"
  done
}
 

create_files_with_timestamps_and_sizes() {
  bash_script="path_to_attached_bash_script.sh"  
 
  if [ -f "$bash_script" ]; then
   
    bash "$bash_script"
  else
    echo "Bash script not found."
  fi
}
 

main() {
  create_faculty_directories
  set_permissions_and_ownership
  create_files_in_faculty_directories
  search_for_test_files
  create_files_with_timestamps_and_sizes
}
 

main