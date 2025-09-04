# Use stable Node 22 LTS (bullseye)
FROM node:22-bullseye

# Set working directory
WORKDIR /app

# Copy package files
COPY package.json package-lock.json* ./

# Install dependencies using legacy-peer-deps to resolve conflicts
RUN npm install --legacy-peer-deps

# Copy all app code
COPY . .

# Expose port for QR code server if used
EXPOSE 3000

# Start the bot
CMD ["node", "index.js"]
