# Use Node 22
FROM node:22-slim

# Install Git (Required)
RUN apt-get update && apt-get install -y git

# Install the Agent
RUN npm install -g openclaw

# Set Work Directory
WORKDIR /app

# Run Command:
# 1. rm -rf ... -> Deletes any bad config file that might be hiding
# 2. openclaw ... -> Starts the agent on Port 3000
CMD ["/bin/sh", "-c", "rm -rf /root/.openclaw && openclaw gateway --port 3000 --allow-unconfigured"]
