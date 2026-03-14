#!/bin/bash
# Author: Safiatu Seidu
# Date: March 14, 2026
# Description: Script to create user, group and assign permissions

echo "Creating group..."
sudo groupadd devops

echo "Creating user..."
sudo useradd -m -s /bin/bash safiauser

echo "Setting password for user..."
sudo passwd safiauser

echo "Adding user to group..."
sudo usermod -aG devops safiauser

echo "Creating project directory..."
sudo mkdir /opt/devops_project

echo "Assigning group ownership..."
sudo chown :devops /opt/devops_project

echo "Setting permissions..."
sudo chmod 770 /opt/devops_project

echo "User and group configuration completed!"
