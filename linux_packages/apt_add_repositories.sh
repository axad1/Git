#!/bin/bash

# Enable standard Ubuntu repositories
echo "Enabling universe, multiverse, restricted, and backports repositories..."
sudo add-apt-repository -y universe
sudo add-apt-repository -y multiverse
sudo add-apt-repository -y restricted
sudo add-apt-repository -y backports

# Update package list
echo "Updating package lists..."
sudo apt update
echo "✅ All packages updated. Press Enter to exit."
read