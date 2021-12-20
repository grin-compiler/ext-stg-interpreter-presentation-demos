#!/usr/bin/env sh
set -eu

ghcup_version="$1"
ghcup_checksum="$2"
file_path="$3"

wget \
  -O "/tmp/ghcup" \
  "https://downloads.haskell.org/~ghcup/${ghcup_version}/x86_64-linux-ghcup-${ghcup_version}" &&\

if ! echo "${ghcup_checksum}  ${file_path}" | sha256sum -c -; then
    echo "${file_path} checksum failed" >&2
    echo "expected '${ghcup_checksum}', but got '$( sha256sum "${file_path}" )'" >&2
    exit 1
fi;
