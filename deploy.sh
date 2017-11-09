# Script to deploy the app
# This file is needed only when you want to deploy the app to a Linux VM
sudo apt-get update
sudo apt-get install git

# install node
wget https://nodejs.org/dist/v4.2.3/node-v4.2.3-linux-x64.tar.gz
mkdir node
tar xvf node-v*.tar.?z --strip-components=1 -C ./node
rm -rf node-v*
mkdir node/etc
echo 'prefix=/usr/local' > node/etc/npmrc
sudo mv node /opt/
sudo chown -R root: /opt/node
sudo ln -s /opt/node/bin/node /usr/local/bin/node
sudo ln -s /opt/node/bin/npm /usr/local/bin/npm

# install express
sudo npm install express -y

# run server
nodejs server.js
