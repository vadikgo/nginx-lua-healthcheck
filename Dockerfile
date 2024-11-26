FROM fabiocicerchia/nginx-lua:1.27-debian

RUN mkdir -p /opt/app-root/etc/nginx.default.d

COPY conf.d/default.conf /etc/nginx/conf.d/default.conf
COPY conf.d/lua-resty-http/lib/resty/*.lua /usr/local/share/lua/5.1/resty/

STOPSIGNAL SIGQUIT

CMD nginx -g "daemon off;error_log /dev/stdout info;"
