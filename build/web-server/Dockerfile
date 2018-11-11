FROM golang:1.11.2-alpine as builder

RUN apk add --no-cache git
RUN go get -u github.com/mholt/caddy \
  && go get -u github.com/caddyserver/builds
RUN cd src/github.com/mholt/caddy/caddy \
  && go run build.go -goos=linux -goarch=amd64 \
  && mv caddy /go/bin/

FROM alpine:latest
LABEL maintainer "Sparkness"

COPY --from=builder /go/bin/caddy /usr/bin/caddy
COPY Caddyfile /etc/Caddyfile
RUN apk add --no-cache openssh-client ca-certificates

CMD ["/usr/bin/caddy", "-conf=/etc/Caddyfile", "--log", "stdout", "--agree=true"]
