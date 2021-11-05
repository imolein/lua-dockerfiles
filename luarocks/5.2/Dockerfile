ARG luarocks_version="3.7.0"

FROM alpine:latest AS verify

ARG luarocks_version
ENV LUAROCKS_VERSION=$luarocks_version
ENV LUAROCKS_GPG_KEY="3FD8F43C2BB3C478"

RUN set -ex \
    && apk add --no-cache gnupg \
    && gpg --keyserver keyserver.ubuntu.com --recv-keys ${LUAROCKS_GPG_KEY} \
    && wget -c https://luarocks.org/releases/luarocks-${LUAROCKS_VERSION}.tar.gz \
    && wget -c https://luarocks.org/releases/luarocks-${LUAROCKS_VERSION}.tar.gz.asc \
    && gpg --verify luarocks-${LUAROCKS_VERSION}.tar.gz.asc luarocks-${LUAROCKS_VERSION}.tar.gz

FROM imolein/lua:5.2

LABEL maintainer="Sebastian Huebner <sh@kokolor.es>"

ARG luarocks_version
ENV LUAROCKS_VERSION=$luarocks_version

COPY --from=verify luarocks-${LUAROCKS_VERSION}.tar.gz .

# Install build environment so C modules can be build directly using this image
# without installing stuff before
RUN set -ex \
    && apk add --no-cache build-base \
      m4 \
      bsd-compat-headers \
      openssl \
      openssl-dev \
      ca-certificates \
      curl \
      unzip \
      git \
    && tar -xzf luarocks-${LUAROCKS_VERSION}.tar.gz \
    && cd luarocks-${LUAROCKS_VERSION} \
    && ./configure --with-lua=/usr/local \
    && make build \
    && make install \
    && cd .. \
    && rm -f luarocks-${LUAROCKS_VERSION}.tar.gz \
    && rm -rf luarocks-${LUAROCKS_VERSION}

CMD ["luarocks"]
