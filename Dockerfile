FROM alpine:3.7

RUN apk -U --no-cache add curl \
    && curl -sLf https://get.docker.com/builds/Linux/x86_64/docker-1.12.3.tgz | tar xvzf - -C /usr/local/bin --strip-components=1 docker/docker \
    && chmod +x /usr/local/bin/docker

COPY entrypoint.sh /usr/local/bin
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
