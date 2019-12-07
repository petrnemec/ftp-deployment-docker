FROM ubuntu:18.04

ENV COMPOSER_ALLOW_SUPERUSER 1
ENV DEBIAN_FRONTEND noninteractive

# Install packages
RUN apt-get update && apt-get -y install \
        curl \
        git \
        php-cli \
        php-ssh2 \
        unzip
    && rm -rf /var/lib/apt/lists/*

# Install Composer
RUN curl -sS https://getcomposer.org/installer \
        | php -- --install-dir=/usr/local/bin --filename=composer

# Install FTP Deployment
RUN composer global require "dg/ftp-deployment:^3.2" \
    && composer clear-cache \
    && ln -s ~/.composer/vendor/bin/deployment /usr/local/bin/deployment
