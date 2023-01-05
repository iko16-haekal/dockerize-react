FROM node:14-bullseye-slim AS builder

WORKDIR /app

COPY package.json .
RUN ["yarn", "install"]

COPY . .
RUN ["yarn", "build"]


FROM nginx
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /app/dist /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]