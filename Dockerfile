# Use Node 22
FROM node:22-slim

# Install Git
RUN apt-get update && apt-get install -y git

# Install the OpenClaw package
RUN npm install -g openclaw

# Set working directory
WORKDIR /app

# Run the Gateway (Use the variable we set)
CMD ["openclaw", "gateway", "--port", "3000"]
