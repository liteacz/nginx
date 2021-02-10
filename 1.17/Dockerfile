FROM nginx:1.17-alpine

COPY ./1.17/init.d /opt/litea/init.d
RUN chmod +x /opt/litea/init.d/*

COPY ./1.17/conf /opt/litea/conf
COPY ./1.17/lit.sh /usr/local/bin/lit
COPY ./1.17/docker-entrypoint.sh /usr/local/bin/docker-entrypoint

RUN chmod +x \
    /usr/local/bin/lit \
    /usr/local/bin/docker-entrypoint

RUN lit install nginx

WORKDIR /var/www/

ENTRYPOINT [ "docker-entrypoint" ]
CMD ["nginx"]