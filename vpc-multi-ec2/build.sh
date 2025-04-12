#!/bin/bash

#---------------------------------------------#
# Author: Adam WezvaTechnologies
# Call/Whatsapp: +91-9739110917
#---------------------------------------------#
exec > /var/log/trivy-data.log 2>&1
set -xe



# Install Java 8, Java 11 & Docker
sudo apt update
sudo apt install -y openjdk-8-jdk openjdk-11-jdk docker.io maven
sudo usermod -a -G docker ubuntu

# Install Trivy
sudo wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | sudo apt-key add -
echo deb https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main | sudo tee -a /etc/apt/sources.list.d/trivy.list
sudo apt update
sudo apt install -y trivy

sudo sleep 5; clear
sudo echo "   =================================="
sudo echo "** Your Build server is ready for use **"
sudo echo "   =================================="
