FROM alpine:latest

LABEL maintainer="Sebastian Huebner <sh@kokolor.es>"

ENV LUA_VERSION="5.3.6"
ENV SHA1_CHECKSUM="f27d20d6c81292149bc4308525a9d6733c224fa5"

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
    && rm lua.tar.gz \
    \
    && cd lua-${LUA_VERSION} \
    && make -j"$(nproc)" linux \
    && make install \
    && cd .. \
    && rm -rf lua-${LUA_VERSION} \
    \
    && apk del .build-deps

CMD ["lua"]

