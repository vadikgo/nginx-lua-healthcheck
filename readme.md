# Nginx based healthcheck for external services

Use LUA nginx for a simple healthchek for multiple sites

## Run in docker example

```bash
docker build -t nginx-lua .
docker run -d --name nginx --rm -p 8080:8080 -v ${PWD}/nginx.default.d:/opt/app-root/etc/nginx.default.d nginx-lua
curl http://localhost:8080/healthcheck-targets
curl -w "%{http_code}" http://localhost:8080/healthcheck
docker stop nginx
```

Sites to check is defined in location /healthcheck-targets as json.

Primary use case is to check microservices in Kubernetes for an external load balancer.

Use additional LUA libraries (git subtree add --prefix lua-libs/xxxx git@github.com:yyyy/xxxx.git master --squash):

* https://github.com/ledgetech/lua-resty-http
* https://github.com/fffonion/lua-resty-openssl
