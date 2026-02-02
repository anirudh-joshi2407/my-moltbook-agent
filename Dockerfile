# Use Node 22
FROM node:22-slim

# Install Git and Socat (The Network Bridge)
RUN apt-get update && apt-get install -y git socat

# Install the Agent
RUN npm install -g openclaw

# Set work dir
WORKDIR /app

# The logic is handled in Railway's Start Command
CMD ["bash"]
