FROM node:22-alpine AS builder
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY . .

# Build the Next.js app
RUN npm run build

# Expose port 3000 for the application
EXPOSE 3000

# Start the application in production mode
CMD ["npm", "run", "preview", "--", "--port", "7", "--host", "0.0.0.0"]
