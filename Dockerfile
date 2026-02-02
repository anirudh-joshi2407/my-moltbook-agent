# Use Node 22
FROM node:22-slim

# Install Git (Required for skills)
RUN apt-get update && apt-get install -y git

# Install ONLY the new package (Removing 'moltbot' fixes the binary conflict)
RUN npm install -g openclaw

# Set working directory
WORKDIR /app

# Run the 'prod' mode using the daemon binary
CMD ["openclawd", "prod"]
