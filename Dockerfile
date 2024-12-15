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

RUN npm install \
    @babel/core@^7.0.0 \
    ts-node@>=10.0.0 \
    postcss@^8.4.21 \
    rollup@^2.0.0 \
    react@^18.2.0 \
    react-dom@^18.2.0 \
    @types/react@^18.0.23 \
    react-test-renderer@^18.2.0 \
    cypress@10.11.0 \
    husky@8.0.1 \
    lint-staged@13.0.3 \
    prettier@2.7.1 \
    turbo@1.6.1 \
    typescript@4.8.4 \
    --save-dev --legacy-peer-deps --no-workspaces

# Install dependencies using pnpm
RUN pnpm i

# Expose the default port used by the app
EXPOSE 3000

# Set the default command to start the development server
CMD ["pnpm", "dev"]
