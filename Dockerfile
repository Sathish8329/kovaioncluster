# Frontend
# Use an official Node.js image as a parent image
FROM node:14-alpine

# Set the working directory to /app
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install --force \
    && npm cache clean --force \
    && rm -rf /usr/local/share/.cache /root/.npm
# Copy the rest of the application code to the working directory
COPY . .

# Expose the port your app will run on
EXPOSE 3000

# Start your frontend application
CMD ["npm", "start"]
