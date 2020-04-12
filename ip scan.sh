#!/bin/bash
for ip in $(seq 1 255)
do 
  ping 100.65.128.$ip -c 2
done
