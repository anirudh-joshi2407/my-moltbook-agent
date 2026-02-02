# Use Node 22
FROM node:22-slim

# Install Git (Required)
RUN apt-get update && apt-get install -y git

# Install the Agent
RUN npm install -g openclaw

# Set Work Directory
WORKDIR /app

# START COMMAND
# 1. Deletes old config
# 2. Forces Port 3000
# 3. FORCES THE TOKEN (No variables needed)
CMD ["/bin/sh", "-c", "rm -rf /root/.openclaw && openclaw gateway --port 3000 --token moltbook-secret-access --allow-unconfigured"]
