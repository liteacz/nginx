# Table of contents

## Content

- [Available environment variables](#Available-environment-variables)

## Available environment variables

| Variable name            | Required                                     | Default Value                   | Description    |
| ---------------------    | ----------                                   | ---------------------------     | -------------- |
| `$NGINX_ROOT_DIR`        | false                                        | public                          | Sets document root directory |
| `$HTTP_ERRORS_DIR`       | false                                        | /var/www/errors                 | Path to the directory containing default static pages for common HTTP error codes (404, 500, etc...)  |
| `$FPM_HOST`              | false                                        | php-fpm                         | Hostname of the upstream FPM |
| `$FPM_PORT`              | false                                        | 9000                            | FPM port to use |
| `$DISABLE_DNS_CACHE`     | false                                        | n/a                             | When set to 1 nginx is configured to use provided DNS resolver. When set, env variable `$RESOLVER` is required |
| `$REQUIRED`              | only when `$DISABLE_DNS_CACHED` is used      | n/a                             | Hostname or ip address to custom DNS provider |
