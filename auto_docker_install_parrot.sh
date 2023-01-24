#!/bin/sh

# Antes para este script una vez guardado, ejecutar:
# chmod +x <nombre_script>.sh
# ./<nombre_script>.sh

set -e

sudo apt install -y curl apt-transport-https \
     software-properties-common ca-certificates

curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
echo "deb [arch=amd64] https://download.docker.com/linux/debian stretch stable" | \
  sudo tee /etc/apt/sources.list.d/docker-engine.list

sudo apt-get update -y
sudo apt-get install -y docker-ce

sudo systemctl start docker
sudo systemctl enable docker

sudo gpasswd -a "${USER}" docker

sudo reboot
