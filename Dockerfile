# Start from official n8n image (Debian-based, not Alpine)
FROM node:18-bullseye

# Switch to root to install system packages
USER root

# Install required tools
RUN apt-get update && \
    apt-get install -y ffmpeg graphicsmagick python3 build-essential && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Switch back to non-root user for security
USER node
