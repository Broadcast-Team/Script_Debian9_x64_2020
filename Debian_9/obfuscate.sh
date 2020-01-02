#!/bin/bash
sudo apt update
sudo apt install nodejs
nodejs -v
sudo apt update
sudo apt install curl
cd ~
curl -sL https://deb.nodesource.com/setup_10.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo apt install nodejs
nodejs -v
npm -v
sudo apt install build-essential
curl -sL https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh -o install_nvm.sh
bash install_nvm.sh
source ~/.profile
nvm ls-remote
nvm install 8.11.1
nvm use 8.11.1
node -v
nvm ls
nvm alias default 8.11.1.
nvm use default
npm install express
npm install -g express
npm install -g bash-obfuscate