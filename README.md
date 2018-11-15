# v2ray-tls-docker

## Intro
[V2Ray](https://www.v2ray.com/ "Project V") is a platform for building proxies to bypass network restrictions, the transport protocol supports websockets, so we can use a web server such as [Nginx](http://nginx.org), [Caddy](https://caddyserver.com/), etc. to proxy V2Ray, and enable TLS encryption for a more secure communication environment. It is cumbersome to set up such a set of services, especially configuration file adjustment and TLS configuration. It is organized into a docker container to simplify deployment, and the docker feature can reduce maintenance difficulty.You can also use the CDN service for DNS and HTTP proxy to improve communication speed and service security, such as enabling Authenticated Origin Pulls and disabling the insecure TLS protocol.

## Prerequisites
  * Linux amd64 server
  * Docker

## Install

  ```bash
  git clone https://github.com/Sparkness/v2ray-tls-docker.git
  cd v2ray-tls-docker
  # {email} is your email, {dns} is your server`s dns
  ./genconf.sh -m {email} -d {dns}
  # After running genconf.sh, you will get the client conf info
  # Need to release port 80 for acme certificate issuance
  docker-compose up -d
  ```

  (optional) if you want to build new images, you can run the following after genconf.sh:

  ```bash
  docker-compose -f docker-compose.build.yaml up -d
  ```

## Customzation

  you can run genconf with -p option to enable caddy plugin, eg:

  ```bash
  ./genconf.sh -m example@a.com -d example.com -p http.cache,tls.dns.cloudflare
  ```

  Use a comma to separate the plugin name.
