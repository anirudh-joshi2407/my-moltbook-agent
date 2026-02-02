# Use Node 22
FROM node:22-slim

# Install the Agent (No socat needed anymore)
RUN npm install -g openclaw

# Set Work Directory
WORKDIR /app

# Create the Simple Start Script
# 1. Configures agent to listen on 0.0.0.0 (Public Internet)
# 2. Disables Pairing Security (So you don't get Error 1008)
# 3. Sets Port 3000 (Matches Railway)
RUN printf "#!/bin/bash\n" > start.sh && \
    printf "mkdir -p /root/.openclaw\n" >> start.sh && \
    printf "echo '{\"gateway\":{\"bind\":\"0.0.0.0\",\"trustedProxies\":[\"*\"],\"controlUi\":{\"allowed\":true,\"allowInsecureAuth\":true}},\"llm\":{\"provider\":\"google\"}}' > /root/.openclaw/config.json\n" >> start.sh && \
    printf "openclaw gateway --port 3000 --allow-unconfigured\n" >> start.sh && \
    chmod +x start.sh

# Run the script
CMD ["./start.sh"]
