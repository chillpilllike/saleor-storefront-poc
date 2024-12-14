# Use Node.js 20 as the base image
FROM node:18-alpine

# Install necessary build tools and utilities
RUN apk add --no-cache bash git libc6-compat

# Set the working directory inside the container
WORKDIR /app

# Install pnpm globally
RUN corepack enable && corepack prepare pnpm@9.15.0 --activate

# Copy the entire project to the working directory
COPY . .

# Install dependencies using pnpm
RUN pnpm i

# Expose the default port used by the app
EXPOSE 3000

# Set the default command to start the development server
CMD ["pnpm", "dev"]
