FROM node:24-alpine3.20

# Create app directory & set default dir so that next commands executes in /usr/app dir, liked cd-ing into /usr/app to execute npm install
WORKDIR /usr/app

# Copy package.json, wildcard used so both package.json AND package-lock.json are copied
# slash '/' at the end of app is important, so it created an app directory, otherwise you'll get an error
COPY package*.json ./

EXPOSE 3000

# Copy app files from src directory
COPY src ./

# Install app dependencies
RUN npm install

# Start the application
CMD ["node", "server.js"]