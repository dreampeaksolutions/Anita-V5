# Use stable Node LTS
FROM node:22-bullseye

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package.json package-lock.json* ./

# Install dependencies with legacy-peer-deps to bypass conflicts
RUN npm install --legacy-peer-deps

# Copy rest of the code
COPY . .

# Expose port (adjust if needed)
EXPOSE 3000

# Start the bot
CMD ["node", "index.js"]
