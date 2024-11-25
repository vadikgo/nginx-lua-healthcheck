# Nginx based healthcheck for external services

Use openresty nginx for simple healthchek for multiple sites

## Run in docker example

```bash
docker run -d --name nginx --rm -p 8080:80 -v $PWD/conf.d:/etc/nginx/conf.d fabiocicerchia/nginx-lua:1.27-debian
curl http://localhost:8080/healthcheck-targets
curl -w "%{http_code}" http://localhost:8080/healthcheck
docker stop nginx
```

Sites to check is defined in location /healthcheck-targets as json.

Primary use case is to check microservices in Kubernetes for an external load balancer.

Use additional LUA libraries:

* https://github.com/ledgetech/lua-resty-http
