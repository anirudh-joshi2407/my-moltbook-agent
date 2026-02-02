# Use Node 22
FROM node:22-slim

# Install Git and Socat (The Traffic Forwarder)
RUN apt-get update && apt-get install -y git socat

# Install the OpenClaw agent
RUN npm install -g openclaw

# Set working directory
WORKDIR /app

# The command is handled in Railway
CMD ["bash"]
