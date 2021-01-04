FROM imolein/lua:5.1

LABEL maintainer = "Sebastian Huebner <sh@kokolor.es>"

ENV LUAROCKS_VERSION 3.5.0

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
    && wget -cO - https://luarocks.org/releases/luarocks-${LUAROCKS_VERSION}.tar.gz | \
      tar -xzf - \
    && cd luarocks-${LUAROCKS_VERSION} \
    && ./configure --with-lua=/usr/local \
    && make build \
    && make install \
    && cd .. \
    && rm -rf luarocks-${LUAROCKS_VERSION}

CMD ["luarocks"]
