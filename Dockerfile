FROM node:20-alpine

# Install Yarn
RUN apk add --no-cache yarn

# Install dependencies
WORKDIR /usr/src/app/

EXPOSE 3000