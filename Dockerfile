# Use the official Node.js image as a builder
FROM node:16 AS builder

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json for dependency installation
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the source code into the container
COPY . .

# Build the React app
RUN npm run build

# Use a lightweight web server to serve static files
FROM nginx:1.21 AS production

# Set the working directory inside the container
WORKDIR /usr/share/nginx/html

# Remove the default NGINX static files
RUN rm -rf ./*

# Copy built files from the builder stage
COPY --from=builder /app/build .

# Expose the default NGINX port
EXPOSE 80

# Start the NGINX server
CMD ["nginx", "-g", "daemon off;"]