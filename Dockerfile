FROM node:14-bullseye-slim

WORKDIR /app

COPY package.json .
RUN ["yarn", "install"]

COPY . .
RUN ["yarn", "build"]

EXPOSE 4000

CMD yarn dev --port 4000 --host 0.0.0.0