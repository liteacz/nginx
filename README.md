# Enhanced dockerized NGINX 🐳
> NGINX image pre-configured to use with [FastCGI Process Managers](https://www.php.net/manual/en/install.fpm.php)

## Documentation 📖

Documentation is located in the [docs](./docs) directory of this repository.

## Content 📜

- [About](#About)
- [Getting started](#Getting-started)


## About ℹ️

In our day to day work, we maintain a lot of **dockerized** projects.
The dockerization itself is rather straightforward, but with every new project the process of dockerzing is quite **repetitive**, so we extracted the most common settings and extensions
and created this set of images.

This is a simple docker image derived from `nginx:alpine` meant to be used with FastCGI backend. It is pre-configured in a way that makes it easy to use without unnecessary boilerplate using environment variables.

## Getting started

Assuming the following project structure, here is simple `docker-compose.yml` example that shows how to use the [fpm](http://github.com/liteacz/fpm) and **nginx** images together for local development.

```
myproject
├── app
│   └── MyController.php
├── docker-compose.yml
└── public
    └── index.php
```

**docker-compose.yml**

```yml
version: "3"
services:
  nginx:
    image: liteacz/nginx:1.17
    environment:
      NGINX_ROOT_DIR: public
    ports:
      - 8000:80
    volumes:
      - ./public:/var/www/data/public
    depends_on:
      - php-fpm
  php-fpm:
    image: liteacz/php:7.4-fpm-dev
    environment:
      FPM_ROOT_DIR: public
    volumes:
      - ./:/var/www/data
```

As you can see you don't need to create you own **nginx.conf** nor **php.ini** nor **www.conf** files. We try to cover basic usage via tweaking the images with environment variables (for the basic usage it's two of them).

Now when you call `docker-compose up -d` from within `myproject` folder you'll see something similar to:

```bash
$ myproject docker-compose up -d
Creating network "myproject_default" with the default driver
Creating myproject_php-fpm_1 ... done
Creating myproject_nginx_1   ... done
```

**Note**

> If you don't have php and nginx images pulled locally, the first run will take some time to pull them. The subsequent start (`docker-compose up -d`) will be faster.


Now verify that both nginx and php-fpm containers are up and running:

```bash
$ docker ps -a
CONTAINER ID        IMAGE                     COMMAND                  CREATED             STATUS              PORTS                  NAMES
bf29810d03ba        liteacz/nginx:1.17        "/var/www/entrypoint…"   2 seconds ago       Up 1 second         0.0.0.0:8000->80/tcp   myproject_nginx_1
a70de460d91f        liteacz/php:7.4-fpm-dev   "docker-php-entrypoi…"   3 seconds ago       Up 2 seconds        9000/tcp               myproject_php-fpm_1
```

If you see "Up ..." within the "STATUS" column you should be able to navigate to [localhost:8000](http://localhost:8000) and see the "Hello dockerized PHP world!" message.
