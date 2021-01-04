#!/usr/bin/env bash
set -eo pipefail


cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
versions=( */ )
for version in "${versions[@]%/}" ; do
    image=imolein/luarocks:${version}
    echo building "${image}" ...
    docker build -q -t "${image}" "${version}"
    docker run --rm "${image}" lua -v
done
