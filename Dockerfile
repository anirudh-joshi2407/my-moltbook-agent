# Use Node 22 (Required for the 2026 agent runtime)
FROM node:22-slim

# Install BOTH package names to survive the rebrand chaos
# We install 'openclaw' first, then 'moltbot' as fallback
RUN npm install -g openclaw moltbot

# Set a NEUTRAL working directory (Crucial Fix)
# We do NOT use /root/.moltbot here to prevent the path collision
WORKDIR /app

# Run the agent using 'npx' to auto-locate the binary
# We use the 'openclaw' command which is the new standard as of Feb 1st
CMD ["npx", "openclaw", "onboard", "--non-interactive", "--accept-risk"]
