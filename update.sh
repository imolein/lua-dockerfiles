#!/bin/bash
set -eo pipefail


for c in lua luarocks; do
  ${c}/update.sh
done

docker images
