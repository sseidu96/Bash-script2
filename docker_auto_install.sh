#!/bin/bash
# Author: Safiatu Seidu
# Date: March 14, 2026
# Description: Automated Docker installation for Ubuntu/Debian or CentOS/RHEL

# Function: Ubuntu/Debian Docker install
install_docker_ubuntu() {
    echo "Detected Ubuntu/Debian. Installing Docker..."
    sudo apt update
    sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] \
https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    sudo apt update
    sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

    sudo systemctl enable docker
    sudo systemctl start docker

    echo "Docker installed successfully on Ubuntu/Debian!"
}

# Function: CentOS/RHEL Docker install
install_docker_centos() {
    echo "Detected CentOS/RHEL. Installing Docker..."
    sudo yum remove -y docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-engine
    sudo yum install -y yum-utils device-mapper-persistent-data lvm2
    sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
    sudo yum install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

    sudo systemctl enable docker
    sudo systemctl start docker

    echo "Docker installed successfully on CentOS/RHEL!"
}

# Detect OS
if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS_NAME=$ID
else
    echo "Cannot detect OS. Exiting."
    exit 1
fi

# Run the appropriate installation function
case "$OS_NAME" in
    ubuntu|debian)
        install_docker_ubuntu
        ;;
    centos|rhel|fedora)
        install_docker_centos
        ;;
    *)
        echo "Unsupported Linux distro: $OS_NAME"
        exit 1
        ;;
esac

# Optional: Add current user to Docker group (non-root Docker usage)
echo "Adding current user to docker group..."
sudo usermod -aG docker $USER
newgrp docker

# Verify installation
echo "Verifying Docker installation..."
docker --version
docker run hello-world

echo "Docker setup complete! You can now run Docker commands without sudo."
