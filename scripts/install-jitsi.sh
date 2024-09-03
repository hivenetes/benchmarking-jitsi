#!/bin/bash

# Step 1: Install the Jitsi repository key onto your system
echo "Installing Jitsi repository key..."
curl https://download.jitsi.org/jitsi-key.gpg.key | sudo sh -c 'gpg --dearmor > /usr/share/keyrings/jitsi-keyring.gpg'

# Step 2: Create a sources.list.d file with the repository
echo "Adding Jitsi repository to sources.list.d..."
echo 'deb [signed-by=/usr/share/keyrings/jitsi-keyring.gpg] https://download.jitsi.org stable/' | sudo tee /etc/apt/sources.list.d/jitsi-stable.list > /dev/null

# Step 3: Update your package list
echo "Updating package list..."
sudo apt-get -y update

# Step 4: Install the full suite or specific packages as needed
# Uncomment the line corresponding to the packages you want to install

# Install the full Jitsi suite:
echo "Installing Jitsi Meet..."
sudo apt-get -y install jitsi-meet

# Or install only specific components:
# echo "Installing Jitsi VideoBridge..."
sudo apt-get -y install jitsi-videobridge

# echo "Installing Jicofo..."
sudo apt-get -y install jicofo

# echo "Installing Jigasi..."
sudo apt-get -y install jigasi

echo "Installation completed."