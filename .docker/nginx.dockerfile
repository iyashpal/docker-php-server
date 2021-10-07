FROM nginx:stable-alpine

ENV NGINX_USER=docker
ENV NGINX_GROUP=docker


RUN mkdir -p /var/www/html

ADD nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf

RUN sed -i "s/user www-data/user ${NGINX_USER}/g" /etc/nginx/nginx.conf

RUN adduser -g ${NGINX_GROUP} -s /bin/sh -D ${NGINX_USER}
