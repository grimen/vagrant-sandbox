#!/usr/bin/env sh
echo "deb http://packages.devstructure.com $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/devstructure.list
sudo wget -O /etc/apt/trusted.gpg.d/devstructure.gpg http://packages.devstructure.com/keyring.gpg
sudo apt-get update
sudo apt-get -y install blueprint