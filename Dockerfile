# Use Node 22 (Required for OpenClaw/Moltbot)
FROM node:22-slim

# Install the agent globally from the official NPM registry
RUN npm install -g moltbot@latest

# Set the working directory
WORKDIR /root/.moltbot

# Start the daemon in "Headless" mode 
# We use --accept-risk to bypass the "Are you sure?" interactive prompts
CMD ["moltbot", "onboard", "--non-interactive", "--accept-risk"]
