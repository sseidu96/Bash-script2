#!/bin/bash
# Author: Safiatu Seidu
# Date: March 14, 2026
# Description: Automated Jenkins installation on CentOS 7 with Docker, Git, and Java 11

LOG_FILE="/var/log/jenkins_install.log"
exec > >(tee -i $LOG_FILE) 2>&1

echo "Starting Jenkins installation at $(date)"

# -----------------------
# 1. Update system
# -----------------------
sudo yum update -y

# -----------------------
# 2. Install wget, git, unzip
# -----------------------
sudo yum install -y wget git unzip

# -----------------------
# 3. Add Jenkins repo
# -----------------------
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

# -----------------------
# 4. Upgrade system (optional)
# -----------------------
sudo yum upgrade -y

# -----------------------
# 5. Install and enable Docker
# -----------------------
sudo yum install -y docker
sudo systemctl start docker
sudo systemctl enable docker.service
sudo chmod 777 /var/run/docker.sock

# -----------------------
# 6. Install Java 11
# -----------------------
sudo yum install -y java-11*

# -----------------------
# 7. Install Jenkins
# -----------------------
sudo yum install -y jenkins
sudo systemctl enable jenkins
sudo systemctl start jenkins

# -----------------------
# 8. Display initial Jenkins password
# -----------------------
echo "=============================="
echo "Jenkins installation completed!"
echo "Initial Jenkins Admin Password:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
echo "=============================="

echo "Access Jenkins via browser: http://<Lightsail_IP>:8080"
