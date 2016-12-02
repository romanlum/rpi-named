FROM hypriot/rpi-alpine:3.4
MAINTAINER Roman Lumetsberger <public+docker@lumetsnet.at>
EXPOSE 53/udp 53/tcp
RUN apk update &&\
    apk upgrade &&\
    apk add ca-certificates &&\
    rm -rf /var/cache/apk/*

RUN apk --update add bind
# make named directories
RUN mkdir -m 0755 -p /var/run/named && chown -R root:named /var/run/named
# /var/cache/bind needs to be owned by "bind"
# since we are mounting, do it manually
# NOTE: Per Dockerfile manual --> need to mkdir the mounted dir to chown
RUN mkdir -m 0755 -p /var/cache/bind && touch /var/cache/bind/docker-init && chown -R named:named /var/cache/bind

VOLUME ["/etc/bind"]

COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]