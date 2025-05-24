# Use Debian-based Node image for full compatibility
FROM node:18-bullseye

# Define the version of n8n to install
ARG N8N_VERSION=1.56.1

# Install required packages
RUN apt-get update && \
    apt-get install -y ffmpeg graphicsmagick tzdata python3 build-essential && \
    npm_config_user=root npm install --location=global n8n@${N8N_VERSION} && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /data

# Set necessary environment variables
ENV N8N_USER_ID=root

# Expose default port
EXPOSE 5678

# Start n8n
CMD ["n8n", "start"]
