# Build container with php-fpm and nginx

## PHP-FPM
Multiple release. Configure or add a new folder release

## NGINX
release : mainline

## config.docker file
```ini
DOCKERFILE_FROM_PHP=php:8.2-fpm-bullseye
DOCKERFILE_PHP_RELEASE=8.2
VENDOR=wyzenrepo
IMAGE=php-nginx
TAG=$DOCKERFILE_PHP_RELEASE
SHELL=sh
```
- DOCKERFILE_FROM_PHP : php image
- DOCKERFILE_PHP_RELEASE : release of php
- VENDOR : you vendor
- IMAGE : your image name
- TAG : Tag of image. Default $DOCKERFILE_PHP_RELEASE
- SHELL : shell
