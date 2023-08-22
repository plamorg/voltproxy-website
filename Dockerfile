FROM node:20-alpine3.17 AS builder

WORKDIR /app

COPY package.json yarn.lock .
RUN yarn install

COPY . .
RUN yarn build

FROM nginx:1.25.1-alpine3.17

COPY ./nginx.conf /etc/nginx/nginx.conf
COPY --from=builder /app/dist /usr/share/nginx/html

EXPOSE 8080
