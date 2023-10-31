#!/bin/bash
 
mkdir -p ~/task5
 

ps aux > ~/task5/task5-1.txt
 

sleep 10 &
sleep_pid=$!
 

jobs -l > ~/task5/task5-3.txt
 

top -b -n 1 > ~/task5/task5-4.txt
 

df -h > ~/task5/task5-5.txt
 

df -h | awk 'NR>1 {print $1, $2, $5}' > ~/task5/task5-6.txt
 

free -h > ~/task5/task5-7.txt
 
kill $sleep_pid
 
echo "Task completed. Output files are in ~/task5 directory."