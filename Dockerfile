# Build stage
FROM node:22-alpine AS builder
WORKDIR /usr/src/app

COPY package*.json ./
RUN npm install

COPY . .

# Build the Vite app
RUN npm run build

# Production stage
FROM nginx:stable-alpine AS production
WORKDIR /usr/share/nginx/html

# Copy the build output to the production stage
COPY --from=builder /usr/src/app/dist .

# Expose port 80 for production
EXPOSE 80

# Start nginx server
CMD ["nginx", "-g", "daemon off;"]

