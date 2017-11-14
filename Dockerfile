# Create a container with the node app
# This file is needed only if you plan to package the app as a container in your CI process
FROM node:boron

# Create app directory
WORKDIR /app

# Copy files
COPY . .

# Install app dependencies
RUN npm install

EXPOSE 3000 80
CMD ["npm", "start"]
