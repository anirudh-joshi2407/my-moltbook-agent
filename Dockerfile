# Use Node 22
FROM node:22-slim

# Install Git and Socat (The Network Bridge)
RUN apt-get update && apt-get install -y git socat

# Install the Agent
RUN npm install -g openclaw

# Set Work Directory
WORKDIR /app

# Create the "Master Script" directly in the image
# 1. Configures the brain to use Google
# 2. Starts the Bridge (Port 3000 -> 4000)
# 3. Starts the Agent on Port 4000
RUN printf "#!/bin/bash\n" > start.sh && \
    printf "mkdir -p /root/.openclaw\n" >> start.sh && \
    printf "echo '{\"llm\":{\"provider\":\"google\"}}' > /root/.openclaw/config.json\n" >> start.sh && \
    printf "socat TCP-LISTEN:3000,fork,bind=0.0.0.0 TCP:127.0.0.1:4000 &\n" >> start.sh && \
    printf "export PORT=4000\n" >> start.sh && \
    printf "openclaw gateway --port 4000 --allow-unconfigured\n" >> start.sh && \
    chmod +x start.sh

# Run the script automatically
CMD ["./start.sh"]
