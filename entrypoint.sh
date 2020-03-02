#!/bin/sh

cd /var/www/data

[ -z $CUSTOM_SCRIPTS_PATH ] && CUSTOM_SCRIPTS_PATH="/var/www/custom-scripts"

if [ -d $CUSTOM_SCRIPTS_PATH ]; then
  echo "Copying custom scripts"
  cp "$CUSTOM_SCRIPTS_PATH/." /var/www/scripts
fi

for filename in /var/www/scripts/*.sh; do
    if [ -f $filename ]; then
        sh $filename
    fi
done

exec nginx;
