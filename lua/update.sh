#!/bin/bash
set -eo pipefail


cd "$(dirname "$(readlink -f "$BASH_SOURCE")")"
versions=( */ )
for version in "${versions[@]%/}"; do
    image=imolein/lua:${version}
    echo building ${image} ...
    docker build -q -t ${image} ${version}
    docker run --rm ${image} lua -v
done