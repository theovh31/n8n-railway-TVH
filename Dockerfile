FROM node:18-alpine

# Set n8n version to latest
ARG N8N_VERSION=1.88.0

# Install required tools
RUN apk add --no-cache \
    graphicsmagick \
    tzdata \
    python3 \
    make \
    g++ \
    && npm install --location=global n8n@${N8N_VERSION} \
    && apk del make g++

# Set working directory
WORKDIR /data

# Set environment
ENV N8N_USER_ID=1000
ENV N8N_GROUP_ID=1000

# Expose default port
EXPOSE 5678

CMD ["n8n"]
