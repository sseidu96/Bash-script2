#!/bin/bash
# Author: Safiatu Seidu
# Date: March 18, 2026
# Description: Automated Splunk Enterprise installation on Linux (CentOS)

### SPLUNK INSTALLATION SCRIPT ###




cd /opt

sudo yum install wget -y

sudo wget -O splunk-9.0.4.1-419ad9369127-Linux-x86_64.tgz https://download.splunk.com/products/splunk/releases/9.0.4.1/linux/splunk-9.0.4.1-419ad9369127-Linux-x86_64.tgz



#Extract the tar file to /opt
sudo tar -zxvf splunk-9.0.4.1-419ad9369127-Linux-x86_64 tgz -C /opt

sudo rm -rf splunk-9.0.4.1-419ad9369127-Linux-x86_64 tgz 

cd splunk/bin

#Start Splunk Enterprise and set up the admin user and password

sudo ./splunk start --accept-license --answer-yes --no-prompt --seed-passwd "abcd1234"

#Enable splunk at startup

sudo ./splunk enable boot-start

#open splunk on the browser, thru port 8000 and login to check if everything works
#username= admin  and password = abcd1234 ( this can be change in the script.)
echo "please go on the browser, access splunk on port 8000 , username: admin password: abcd1234 "
sleep 4

