# Script to deploy the app
# This file is needed only when you want to deploy the app to a Linux VM
sudo add-apt-repository ppa:nginx/stable -y
sudo apt-get update -y
sudo apt-get install git -y

# install node
wget https://nodejs.org/dist/v8.9.1/node-v8.9.1-linux-x64.tar.gz
rm -rf node
mkdir node
tar xvf node-v*.tar.?z --strip-components=1 -C ./node
rm -rf node-v*
mkdir node/etc
echo 'prefix=/usr/local' > node/etc/npmrc
sudo rm -rf /opt/node
sudo mv -f node /opt/
sudo chown -R root: /opt/node
sudo ln -fs /opt/node/bin/node /usr/local/bin/node
sudo ln -fs /opt/node/bin/npm /usr/local/bin/npm

# install express
sudo npm install express -y -g

# install nginx
sudo apt-get install nginx -y
sudo rm -f /etc/nginx/sites-enabled/default
sudo cp -f ./nginx-config /etc/nginx/sites-available/example
sudo ln -fs /etc/nginx/sites-available/example /etc/nginx/sites-enabled
sudo service nginx reload

# install pm2 and start the node server as a daemon
sudo npm install pm2 -g -y
pm2 delete example -s
pm2 start server.js -n example
