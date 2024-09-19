#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status

# Update and upgrade packages
sudo apt-get update && sudo apt-get upgrade -y

# Install Jitsi Meet dependencies and add repository
sudo apt-get install -y gnupg2 wget
wget -qO - https://download.jitsi.org/jitsi-key.gpg.key | sudo apt-key add -
echo "deb https://download.jitsi.org stable/" | sudo tee /etc/apt/sources.list.d/jitsi-stable.list > /dev/null

# Install Jitsi Meet
sudo apt-get update
sudo apt-get install -y jitsi-meet

# Configure Jitsi Meet and restart services
sudo /usr/share/jitsi-meet/scripts/install-letsencrypt-cert.sh
sudo systemctl restart jicofo jitsi-videobridge2 prosody
