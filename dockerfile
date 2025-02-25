FROM node:16-alpine
WORKDIR /app
RUN apk add --no-cache bash
RUN npm install -g laravel-echo-server
COPY laravel-echo-server.json .
EXPOSE 6001
CMD ["laravel-echo-server", "start"]