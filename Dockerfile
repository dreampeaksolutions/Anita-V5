# Use Node.js 23 LTS (matching package.json engines)
FROM node:23-buster

# Set working directory
WORKDIR /app

# Copy only package.json and package-lock.json first for caching
COPY package.json package-lock.json* ./

# Install dependencies (fixed versions in package.json)
RUN npm install

# Copy the rest of the app files
COPY . .

# Expose the port your bot uses (adjust if needed)
EXPOSE 3000

# Start the bot
CMD ["node", "index.js"]
