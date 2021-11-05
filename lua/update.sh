#!/usr/bin/env bash

set -eo pipefail

docker pull alpine:latest
docker pull ubuntu:latest

cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
lua_versions=( */ )
for lua_version in "${lua_versions[@]%/}"; do
    image="imolein/lua:${lua_version}"

    for dockerfile in ${lua_version}/*; do
        version="${dockerfile##*.}"

        [ "${version}" != "alpine" ] && image="${image}-${version}"

        echo "building '${image}' ..."
        docker build -f "${dockerfile}" -t "${image}" "${lua_version}/"
        docker run --rm "${image}" lua -v
    done
done
