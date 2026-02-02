# Use Node 22
FROM node:22-slim

# Install Git (Required)
RUN apt-get update && apt-get install -y git

# Install the Agent
RUN npm install -g openclaw

# Set Work Directory
WORKDIR /app

# Simple Start Script (No Config File Injection)
# We will rely on Railway Variables for configuration
RUN printf "#!/bin/bash\n" > start.sh && \
    printf "openclaw gateway --port 3000 --allow-unconfigured\n" >> start.sh && \
    chmod +x start.sh

# Run the script
CMD ["./start.sh"]
