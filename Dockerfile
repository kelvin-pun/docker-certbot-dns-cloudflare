FROM alpine:3.10.1

VOLUME /etc/letsencrypt /var/lib/letsencrypt

# Install dependencies and plugin
RUN apk --no-cache -U upgrade 

# Install certbot runtime dependencies
RUN apk add --no-cache --virtual .certbot-deps \
        libffi \
        libssl1.1 \
        openssl \
        ca-certificates \
        py-setuptools \
        binutils \
        python2

# Install certbot from sources
RUN apk add --no-cache --virtual .build-deps \
        gcc \
        linux-headers \
        openssl-dev \
        musl-dev \
        libc-dev \
        libffi-dev \
        py2-pip \
        python2-dev \
    && pip --no-cache-dir install -U pip setuptools \
    && pip --no-cache-dir install -U certbot-dns-cloudflare \
    && apk del .build-deps


