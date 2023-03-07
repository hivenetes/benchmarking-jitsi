#!/bin/bash

# Update the package lists and upgrade installed packages
sudo apt-get update && sudo apt-get upgrade -y

# Install the Jitsi Meet dependencies
sudo apt-get install -y gnupg2 wget

# Add the Jitsi Meet repository key to the system
wget -qO - https://download.jitsi.org/jitsi-key.gpg.key | sudo apt-key add -

# Add the Jitsi Meet repository to the system
echo "deb https://download.jitsi.org stable/" | sudo tee /etc/apt/sources.list.d/jitsi-stable.list

# Update the package lists to include the Jitsi Meet repository
sudo apt-get update

# Install the Jitsi Meet server and its dependencies
sudo apt-get install -y jitsi-meet

# Configure the Jitsi Meet server
sudo /usr/share/jitsi-meet/scripts/install-letsencrypt-cert.sh

# Restart the Jitsi Meet services
sudo systemctl restart jicofo.service
sudo systemctl restart jitsi-videobridge2.service
sudo systemctl restart prosody.service
