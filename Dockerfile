# Use Node 22
FROM node:22-slim

# CRITICAL FIX: Install Git (Required for downloading bleeding-edge skills)
RUN apt-get update && apt-get install -y git

# Install the agent (installing both names to be safe)
RUN npm install -g openclaw moltbot

# Set the neutral working directory
WORKDIR /app

# Run the agent using 'npx' to find the installed binary automatically
CMD ["npx", "openclaw", "onboard", "--non-interactive", "--accept-risk"]
