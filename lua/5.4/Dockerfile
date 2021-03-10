FROM alpine:latest

LABEL maintainer="Sebastian Huebner <sh@kokolor.es>"

ENV LUA_VERSION="5.4.2"
ENV SHA1_CHECKSUM="96d4a21393c94bed286b8dc0568f4bdde8730b22"

RUN set -ex \
    \
    && apk update \
    && apk upgrade \
    && apk add readline-dev \
    && apk add --no-cache --virtual .build-deps \
        make \
        gcc \
        libc-dev \
    \
    && wget -c https://www.lua.org/ftp/lua-${LUA_VERSION}.tar.gz \
        -O lua.tar.gz \
    && [ "$(sha1sum lua.tar.gz | cut -d' ' -f1)" = "${SHA1_CHECKSUM}" ] \
    && tar -xzf lua.tar.gz \
    \
    && cd lua-${LUA_VERSION} \
    && make -j"$(nproc)" linux-readline \
    && make install \
    && cd .. \
    && rm -rf lua-${LUA_VERSION} \
    \
    && apk del .build-deps

CMD ["lua"]
