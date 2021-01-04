#!/usr/bin/env bash
set -eo pipefail

docker pull alpine:latest

cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
versions=( */ )
for version in "${versions[@]%/}"; do
    image=imolein/lua:${version}
    echo building "${image}" ...
    docker build -q -t "${image}" "${version}"
    docker run --rm "${image}" lua -v
done
