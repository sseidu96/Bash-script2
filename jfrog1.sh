#!/bin/bash
# Author: Safiatu Seidu
# Date: March 29, 2026
# Description: Automated JFrog Artifactory OSS installation on Linux (CentOS)

### ARTIFACTORY INSTALLATION SCRIPT ###

# Go to /opt directory
cd /opt
sleep 2

# Install wget, unzip, and Java 8 if not installed
sudo yum install -y wget unzip java-1.8.0-openjdk
sleep 2

# Check Java version
java -version
sleep 2

# Stop existing Artifactory service if running
sudo systemctl stop artifactory > /dev/null 2>&1
sleep 2

# Remove any previous Artifactory installation
sudo rm -rf jfrog* artifactory*
sleep 2

# Download JFrog Artifactory OSS 6.9.6
sudo wget -q https://jfrog.bintray.com/artifactory/jfrog-artifactory-oss-6.9.6.zip
sleep 5

# Extract the zip file to /opt/artifactory
sudo unzip -q jfrog-artifactory-oss-6.9.6.zip -d /opt/artifactory
sleep 5

# Remove the downloaded zip file
sudo rm -f jfrog-artifactory-oss-6.9.6.zip
sleep 2

# Create Artifactory user and set ownership
sudo useradd -r -m -U -d /opt/artifactory -s /bin/false artifactory 2>/dev/null
sudo chown -R artifactory:artifactory /opt/artifactory
sleep 2

# Temporarily disable SELinux (for testing only)
if command -v getenforce >/dev/null 2>&1; then
    sudo setenforce 0
fi
sleep 2

# Create systemd service file for Artifactory
cat <<EOF | sudo tee /etc/systemd/system/artifactory.service
[Unit]
Description=JFrog Artifactory
After=network.target

[Service]
Type=forking
User=artifactory
ExecStart=/opt/artifactory/artifactory-oss-6.9.6/bin/artifactory.sh start
ExecStop=/opt/artifactory/artifactory-oss-6.9.6/bin/artifactory.sh stop
Restart=always

[Install]
WantedBy=multi-user.target
EOF
sleep 2

# Reload systemd daemon
sudo systemctl daemon-reload
sleep 2

# Start Artifactory service
sudo systemctl start artifactory
sleep 5

# Enable Artifactory to start at boot
sudo systemctl enable artifactory
sleep 2

# Get server IP address
IP=$(hostname -I | awk '{print $1}')
sleep 1

# Instructions to access Artifactory
echo "=========================================="
echo "JFrog Artifactory Installed Successfully!"
echo "Please open a browser and access Artifactory on port 8081"
echo "URL: http://$IP:8081"
echo "Default login: admin"
echo "Default password: password"
echo "=========================================="
sleep 4
