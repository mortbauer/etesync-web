FROM node:14.3-alpine as build

ARG VERSION=v0.6.1

WORKDIR /app

RUN apk --no-cache add curl git

RUN curl -L https://github.com/etesync/etesync-web/archive/${VERSION}.tar.gz | tar xz --strip 1 

RUN npm install

ENV REACT_APP_DEFAULT_API_PATH __REACT_APP_DEFAULT_API_PATH__

RUN yarn build

FROM nginx:alpine

COPY nginx.conf /etc/nginx/nginx.conf

COPY --from=build /app/build /usr/share/nginx/html 

COPY entrypoint.sh /entrypoint.sh

EXPOSE 80

ENTRYPOINT ["/entrypoint.sh"]

CMD ["nginx", "-g", "daemon off;"]
