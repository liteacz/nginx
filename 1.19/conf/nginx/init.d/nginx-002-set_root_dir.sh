#!/bin/sh

[[ -z "${NGINX_ROOT_DIR}" ]] && NGINX_ROOT_DIR="/var/www/public"

mkdir -p "${NGINX_ROOT_DIR}"

replace_content="root ${NGINX_ROOT_DIR};"

sed -i \
    -e "s~\# litea.nginx.placeholders.server_root_dir~${replace_content}~g" \
    /etc/nginx/nginx.conf
