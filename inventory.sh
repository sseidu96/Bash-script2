#!/bin/bash
# Author: Safiatu Seidu
# Date: March 14, 2026
# Description: System Inventory Script

echo "========== SYSTEM INVENTORY =========="
sleep 2

echo "Hostname:"
hostname
sleep 2

echo "Current User:"
whoami
sleep 2

echo "Operating System:"
cat /etc/os-release | grep PRETTY_NAME
sleep 2

echo "Kernel Version:"
uname -r
sleep 2

echo "System Uptime:"
uptime
sleep 2

echo "CPU Information:"
lscpu | grep "Model name"
sleep 2

echo "Memory Information:"
free -h
sleep 2

echo "Disk Usage:"
df -h
sleep 2

echo "IP Address:"
hostname -I
sleep 2

echo "Logged in Users:"
who
sleep 2

echo "========== INVENTORY COMPLETE =========="
