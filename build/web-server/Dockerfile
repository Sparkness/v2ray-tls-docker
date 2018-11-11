FROM alpine:latest as builder

ADD getcaddy.sh /go/getcaddy.sh
RUN apk add --no-cache curl
RUN /bin/sh getcaddy.sh \
  && mv caddy /go/bin/

FROM alpine:latest
LABEL maintainer "Sparkness"

COPY --from=builder /go/bin/caddy /usr/bin/caddy
RUN apk add --no-cache openssh-client ca-certificates

CMD ["/usr/bin/caddy", "-conf=/etc/Caddyfile", "--log", "stdout", "--agree=true"]
