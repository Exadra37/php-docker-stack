FROM php:7.1-fpm

ARG CONTAINER_USER=php-fpm
ARG FPM_CONF=/usr/local/etc/php-fpm.d/www.conf

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get -y install \
        libmcrypt-dev \
        zip \
        unzip && \
    docker-php-ext-install \
        pdo_mysql mcrypt && \

    # Create new user
    useradd -m -u 1000 -s /usr/sbin/nologin ${CONTAINER_USER} && \
    sed -i \
        -e "s/user = www-data/user = ${CONTAINER_USER}/g" \
        -e "s/group = www-data/group = ${CONTAINER_USER}/g" \
        "${FPM_CONF}"

COPY ./php-fpm.d/zz-log.conf /usr/local/etc/php-fpm.d/zz-log.conf

WORKDIR /home/"${CONTAINER_USER}"
