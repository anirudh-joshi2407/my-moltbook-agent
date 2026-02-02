# Use Node 22
FROM node:22-slim

# Install Git (THIS IS THE MISSING PIECE)
RUN apt-get update && apt-get install -y git

# Install the Agent
RUN npm install -g openclaw

# Set Work Directory
WORKDIR /app

# Create the Startup Script
# This forces the "Unlocked" configuration every time it starts
RUN printf "#!/bin/bash\n" > start.sh && \
    printf "mkdir -p /root/.openclaw\n" >> start.sh && \
    printf "echo '{\"gateway\":{\"bind\":\"0.0.0.0\",\"trustedProxies\":[\"*\"],\"controlUi\":{\"allowed\":true,\"allowInsecureAuth\":true}},\"llm\":{\"provider\":\"google\"}}' > /root/.openclaw/openclaw.json\n" >> start.sh && \
    printf "openclaw gateway --port 3000 --allow-unconfigured\n" >> start.sh && \
    chmod +x start.sh

# Run the script
CMD ["./start.sh"]
