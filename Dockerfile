# Use an official Node.js runtime as the base image
FROM node:20-alpine

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies using clean install to minimize size
RUN npm ci --only=production

# Copy the entire project into the container
COPY . .

# Expose the port your app runs on
EXPOSE 3030

# Command to start your app
CMD ["node", "server.js"]
