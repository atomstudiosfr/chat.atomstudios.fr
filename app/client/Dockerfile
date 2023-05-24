### STAGE 1: Base ###
FROM node:16-alpine AS base
WORKDIR /usr/src/app
COPY package.json package-lock.json ./
RUN npm ci --legacy-peer-deps
COPY . .
RUN npm run build

### STAGE 2: Run ###
FROM nginx:1.21-alpine
COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=base /usr/src/app/build /usr/share/nginx/html
