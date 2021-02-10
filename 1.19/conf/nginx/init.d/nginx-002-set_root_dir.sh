#!/bin/sh

[[ -z "${NGINX_ROOT_DIR}" ]] && NGINX_ROOT_DIR="/var/www/public"

mkdir -p "${NGINX_ROOT_DIR}"

sed -i \
    -e \
    "s~\# litea.nginx.placeholders.server_root_dir~${NGINX_ROOT_DIR}~g" \
    /etc/nginx/nginx.conf
