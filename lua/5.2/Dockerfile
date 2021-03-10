FROM alpine:latest

LABEL maintainer="Sebastian Huebner <sh@kokolor.es>"

ENV LUA_VERSION="5.2.4"
ENV SHA1_CHECKSUM="ef15259421197e3d85b7d6e4871b8c26fd82c1cf"

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
    && [ "$(sha1sum lua.tar.gz | cut -d' ' -f2)" = "${SHA1_CHECKSUM}" ] \
    && tar -xzf lua.tar.gz \
    \
    && cd lua-${LUA_VERSION} \
    && make -j"$(nproc)" linux \
    && make install \
    && cd .. \
    && rm -rf lua-${LUA_VERSION} \
    \
    && apk del .build-deps

CMD ["lua"]
