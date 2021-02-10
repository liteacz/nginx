FROM nginx:1.19-alpine

COPY ./1.19/init.d /opt/litea/init.d
RUN chmod +x /opt/litea/init.d/*

COPY ./1.19/conf /opt/litea/conf
COPY ./1.19/lit.sh /usr/local/bin/lit
COPY ./1.19/docker-entrypoint.sh /usr/local/bin/docker-entrypoint

RUN chmod +x \
    /usr/local/bin/lit \
    /usr/local/bin/docker-entrypoint

RUN lit install nginx

WORKDIR /var/www/

ENTRYPOINT [ "docker-entrypoint" ]
CMD ["nginx"]