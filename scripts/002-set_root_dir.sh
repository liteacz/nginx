#!/bin/sh

[ -z $NGINX_ROOT_DIR ] && NGINX_ROOT_DIR="/var/www/data/public"

# Set it as root directory
mkdir -p $NGINX_ROOT_DIR
sed -i -e "s/\$NGINX_ROOT_DIR/$NGINX_ROOT_DIR/g" /etc/nginx/nginx.conf
