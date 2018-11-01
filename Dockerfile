FROM php:7.1-cli

RUN apt-get update \
 && apt-get -y install libssh2-1 libssh2-1-dev \
 && pecl install ssh2-1.1.2 \
 && docker-php-ext-enable ssh2 \
 && curl -sSOL https://github.com/dg/ftp-deployment/releases/download/v3.0.1/deployment.phar \
 && mv deployment.phar /usr/local/bin/deployment \
 && chmod +x /usr/local/bin/deployment
