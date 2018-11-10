FROM php:7.1-cli

RUN apt-get update \
  && apt-get -y install libssh2-1 libssh2-1-dev unzip \
  && pecl install ssh2-1.1.2 \
  && docker-php-ext-enable ssh2 \
  && curl -sS https://getcomposer.org/installer \
    | php -- --install-dir=/usr/local/bin --filename=composer \
  && composer global require "dg/ftp-deployment:^3.1" \
  && composer clear-cache \
  && ln -s ~/.composer/vendor/bin/deployment /usr/local/bin/deployment
