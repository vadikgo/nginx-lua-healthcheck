# Nginx based healthcheck for external services

Use openresty nginx for simple healthchek for multiple sites

## Run in docker example

```bash
docker run -d --name nginx --rm -p 8080:80 -v $PWD/conf.d:/etc/nginx/conf.d openresty/openresty:1.21.4.1-0-bullseye-fat
curl -v http://localhost:8080/healthcheck
docker stop nginx
```

Sites to check defined in file default.conf, line:

`local hosts = json.decode('{"vkkp-google":"http://google.com", "sber":"http://sberbank.ru", "localhost": "http://127.0.0.1"}')`

Https is not supported. Primary use case is to chek microservices in kubernetes for external load balancer.

Use additional LUA libraries:

* https://github.com/rxi/json.lua
* https://github.com/ledgetech/lua-resty-http
