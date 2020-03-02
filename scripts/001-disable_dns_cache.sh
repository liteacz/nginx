#!/bin/sh

REPLACE=""

if [ ! -z $DISABLE_DNS_CACHE ] && [ $DISABLE_DNS_CACHE="1" ]; then
    if [ -z $RESOLVER ]; then
        echo "You must provide resolver in order to disable DNS cache"
        exit 1
    fi

    [ -z $FPM_HOST ] && FPM_HOST="php-fpm"
    [ -z $FPM_PORT ] && FPM_PORT="9000"

    echo "Disabling DNS cache"
    REPLACE="resolver $RESOLVER valid=5s ipv6=off;\n            set \$fpm_upstream \"$FPM_HOST:$FPM_PORT\";\n            fastcgi_pass   \$fpm_upstream;"
else
    REPLACE="fastcgi_pass   $FPM_HOST:$FPM_PORT;"
fi

echo "Setting fastcgi pass configuration"
sed -i -e "s/\$FASTCGI_PASS/$REPLACE/g" /etc/nginx/nginx.conf;
