FROM fabiocicerchia/nginx-lua:1.27-debian

RUN mkdir -p /opt/app-root/etc/nginx.default.d /app

COPY conf.d/default.conf /etc/nginx/conf.d/default.conf
COPY lua-libs/lua-resty-http/lib/resty/ /usr/local/share/lua/5.1/resty/
COPY lua-libs/lua-resty-openssl/lib/resty/ /usr/local/share/lua/5.1/resty/

STOPSIGNAL SIGQUIT

CMD nginx -g "daemon off;error_log /dev/stdout info;"
