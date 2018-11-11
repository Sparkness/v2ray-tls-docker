FROM alpine:latest as builder

ADD getcaddy.sh /getcaddy.sh
RUN apk add --no-cache curl
RUN /bin/sh /getcaddy.sh

FROM alpine:latest
LABEL maintainer "Sparkness"

COPY --from=builder /caddy /usr/bin/caddy
RUN apk add --no-cache openssh-client ca-certificates

CMD ["/usr/bin/caddy", "-conf=/etc/Caddyfile", "--log", "stdout", "--agree=true"]
