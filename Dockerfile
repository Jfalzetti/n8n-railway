FROM node:18-bullseye

ARG N8N_VERSION=1.56.1

RUN apt-get update && \
    apt-get install -y ffmpeg graphicsmagick tzdata python3 build-essential && \
    npm_config_user=root npm install -g n8n@${N8N_VERSION} && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /data

ENV N8N_USER_ID=root

EXPOSE 5678

CMD ["n8n", "start"]
