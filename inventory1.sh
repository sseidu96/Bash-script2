#!/bin/bash
# Author: Safiatu Seidu
# Date: March 14, 2026
# Description: Advanced System Inventory Script with Report File

REPORT="/tmp/system_inventory_$(date +%F).txt"

echo "Generating system inventory report..."
sleep 2

echo "========== SYSTEM INVENTORY REPORT ==========" > $REPORT
echo "Date: $(date)" >> $REPORT
echo "" >> $REPORT

echo "Hostname:" >> $REPORT
hostname >> $REPORT
echo "" >> $REPORT

echo "Current User:" >> $REPORT
whoami >> $REPORT
echo "" >> $REPORT

echo "Operating System:" >> $REPORT
cat /etc/os-release | grep PRETTY_NAME >> $REPORT
echo "" >> $REPORT

echo "Kernel Version:" >> $REPORT
uname -r >> $REPORT
echo "" >> $REPORT

echo "System Uptime:" >> $REPORT
uptime >> $REPORT
echo "" >> $REPORT

echo "CPU Information:" >> $REPORT
lscpu | grep "Model name" >> $REPORT
echo "" >> $REPORT

echo "Memory Information:" >> $REPORT
free -h >> $REPORT
echo "" >> $REPORT

echo "Disk Usage:" >> $REPORT
df -h >> $REPORT
echo "" >> $REPORT

echo "IP Address:" >> $REPORT
hostname -I >> $REPORT
echo "" >> $REPORT

echo "Logged in Users:" >> $REPORT
who >> $REPORT
echo "" >> $REPORT

echo "========== END OF REPORT ==========" >> $REPORT

echo "Inventory report saved to: $REPORT"
