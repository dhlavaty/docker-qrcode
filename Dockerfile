FROM alpine:edge

RUN apk add libqrencode=4.1.1-r1 --no-cache && \
    rm -rf /var/cache/apk/*

# Use `hadolint` to check this file:
#    $ docker run --rm -i hadolint/hadolint < Dockerfile
