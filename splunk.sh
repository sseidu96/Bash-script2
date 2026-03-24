#!/bin/bash
# Author: Safiatu Seidu
# Date: March 18, 2026
# Description: Automated Splunk Enterprise installation on Linux (CentOS)

### SPLUNK INSTALLATION SCRIPT ###

# Go to /opt directory
cd /opt
sleep 2

# Install wget if not installed
sudo yum install -y wget
sleep 2

# Download the Splunk Enterprise tar file
sudo wget -O splunk-9.0.4.1-419ad9369127-Linux-x86_64.tgz https://download.splunk.com/products/splunk/releases/9.0.4.1/linux/splunk-9.0.4.1-419ad9369127-Linux-x86_64.tgz
sleep 5

# Extract the tar file to /opt
sudo tar -zxvf splunk-9.0.4.1-419ad9369127-Linux-x86_64.tgz -C /opt
sleep 5

# Remove the downloaded tar file
sudo rm -f splunk-9.0.4.1-419ad9369127-Linux-x86_64.tgz
sleep 2

# Move into Splunk bin directory
cd /opt/splunk/bin
sleep 2

# Start Splunk Enterprise and set up admin user & password
sudo ./splunk start --accept-license --answer-yes --no-prompt --seed-passwd "abcd1234"
sleep 10

# Enable Splunk to start at boot
sudo ./splunk enable boot-start
sleep 5

# Instructions to access Splunk
echo "Please open a browser and access Splunk on port 8000"
echo "Username: admin"
echo "Password: abcd1234"
sleep 4
