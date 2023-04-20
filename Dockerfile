FROM node:18-alpine as base
WORKDIR /usr/src/app
COPY package*.json .
EXPOSE 3000
CMD ["npm", "start"]
FROM base as production
ENV NODE_ENV=production
RUN npm ci
COPY . .
FROM base as development
ENV NODE_ENV=development
RUN npm install -g nodemon@^2.0.20 && npm install
COPY . .
