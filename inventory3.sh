#!/bin/bash

## Author: Safiatu Seidu
# Date: March 29, 2026
# Description: system full inventory

echo "Below find the number of cpu:"
sleep 3
nproc

echo "Memory info"
sleep 3
free -m

echo "Kernel version below"
sleep 3
uname -r

echo "Below hard drive info"
sleep 3
lsblk
