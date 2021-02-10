#!/bin/sh

case "${1}" in
    "build-local")
        version="${2}"

        docker build \
            -t "liteacz/nginx:${version}-local" \
            -f "${version}/Dockerfile" \
        .
    ;;

    "run-local")
        version="${2}"
        cmd="${3}"

        docker run \
            -it \
            --rm \
            -p 8000:80 \
            "liteacz/nginx:${version}-local" \
            "${cmd}"
        ;;
esac