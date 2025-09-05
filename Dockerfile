# Use Node 20 base image
FROM node:20


# Set working directory
WORKDIR /app

# Copy package files
COPY package.json package-lock.json* ./

# Install dependencies using legacy-peer-deps to resolve conflicts
RUN npm install --legacy-peer-deps

# Copy all app code
COPY . .

# Create session folder for QR auth persistence
RUN mkdir -p /app/session

# Expose port for QR code server if used
EXPOSE 3000

# Start the bot with persistent session
CMD ["node", "index.js"]
