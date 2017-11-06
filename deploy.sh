# Script to deploy the app
# This file is needed only when you want to deploy the app to a Linux VM
sudo apt-get -y install npm
sudo apt-get -y install nodejs
npm init
npm install express -y
nodejs server.js
