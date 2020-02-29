#!/bin/sh

[ -z $HTTP_ERRORS_DIR ] && HTTP_ERRORS_DIR="/var/www/errors"

mkdir -p $HTTP_ERRORS_DIR
sed -i -e "s/\$HTTP_ERRORS_DIR/$HTTP_ERRORS_DIR/g" /etc/nginx/nginx.conf
