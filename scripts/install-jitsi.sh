#!/bin/bash
set -e

echo "Installing Jitsi..."

# Install repository key and add source
curl -s https://download.jitsi.org/jitsi-key.gpg.key | sudo gpg --dearmor -o /usr/share/keyrings/jitsi-keyring.gpg
echo 'deb [signed-by=/usr/share/keyrings/jitsi-keyring.gpg] https://download.jitsi.org stable/' | sudo tee /etc/apt/sources.list.d/jitsi-stable.list > /dev/null

# Update and install packages
sudo apt-get update -qq
sudo apt-get install -y jitsi-meet jitsi-videobridge jicofo jigasi

echo "Installation completed."