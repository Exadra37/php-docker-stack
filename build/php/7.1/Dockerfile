FROM php:7.1-fpm

#COPY on-docker-build.sh /home/root/on-docker-build.sh

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get -y install libmcrypt-dev && \
    docker-php-ext-install pdo_mysql mcrypt 
    #bash /home/root/on-docker-build.sh

COPY ./php-fpm.d/zz-log.conf /usr/local/etc/php-fpm.d/zz-log.conf

WORKDIR /var/www
