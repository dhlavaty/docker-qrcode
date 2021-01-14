FROM alpine:3.12.3

RUN apk add libqrencode=4.0.2-r0 --no-cache && \
    rm -rf /var/cache/apk/*

# Use `hadolint` to check this file:
#    $ docker run --rm -i hadolint/hadolint < Dockerfile
