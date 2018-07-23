#FROM library/nginx:alpine
FROM openresty/openresty:alpine-fat
#FROM comum/openresty

RUN apk update
RUN apk add libpq postgresql-dev

RUN /usr/local/openresty/luajit/bin/luarocks install pgmoon
RUN /usr/local/openresty/luajit/bin/luarocks install inspect

COPY nginx.conf /usr/local/openresty/nginx/conf/nginx.conf
COPY conf.d/proxy.template /etc/nginx/conf.d/proxy.template
