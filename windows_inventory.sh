#!/bin/bash
# Author: Safiatu Seidu
# Date: March 14, 2026
# Description: Windows System Inventory Script (run in Git Bash)

echo "========== WINDOWS SYSTEM INVENTORY =========="
echo

echo "Hostname:"
hostname
echo

echo "Current User:"
whoami
echo

echo "Operating System:"
systeminfo | grep -i "OS Name"
echo

echo "OS Version:"
systeminfo | grep -i "OS Version"
echo

echo "System Manufacturer and Model:"
systeminfo | grep -E "System Manufacturer|System Model"
echo

echo "CPU Info:"
wmic cpu get Name
echo

echo "Memory Info:"
wmic computersystem get TotalPhysicalMemory
echo

echo "Disk Info:"
wmic logicaldisk get size,freespace,caption
echo

echo "IP Address:"
ipconfig | grep -i "IPv4"
echo

echo "MAC Address:"
getmac
echo

echo "Running Processes (Top 10):"
tasklist | head -10
echo

echo "Installed Software (Sample):"
wmic product get name | head -10
echo

echo "System Uptime:"
systeminfo | grep -i "System Boot Time"
echo

echo "========== INVENTORY COMPLETE =========="
