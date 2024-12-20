	# use the official Node.js image as the base image
FROM node:18

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files
COPY . .

# Build the app for production
RUN npm run build

# Install serve to serve the build
RUN npm install -g serve

# Expose the port on which the app runs
EXPOSE 3000

# Command to run the app
CMD ["serve", "-s", "build"]
