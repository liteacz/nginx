FROM $PARENT_IMAGE

RUN echo "Creating working directories" \
    && mkdir -p /var/www/data /var/www/scripts \
    && adduser -u 82 -D -S -G www-data www-data

COPY entrypoint.sh /var/www/entrypoint.sh
RUN chmod +x /var/www/entrypoint.sh

COPY errors/ /var/www/errors/
COPY scripts/ /var/www/scripts/
COPY nginx.conf /etc/nginx/nginx.conf

WORKDIR /var/www/data

EXPOSE 80

CMD [ "/var/www/entrypoint.sh" ]
