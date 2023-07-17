FROM node:16.13.0-alpine
WORKDIR /app

# Optimization - Do not download deps if they were not changed and clean cache after install 
COPY package*.json ./
RUN npm install && npm cache clean --force

COPY * ./
RUN npm run build
USER node
EXPOSE 4000
ENTRYPOINT [ "node", "dist/main.js" ]