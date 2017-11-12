# HOW TO EXTRACT PHP CONFIGURATION FROM DOCKER CONTAINER

The following instructions assume that on the the host computer we are in the folder we want to copy the Php configuration to.

On this docs we use the image `exadra37/php7-fpm:7.1` but to use the official image we just replace the previous by `php:7.1-fpm`.


##### on the host shell

```bash
sudo docker run --rm -it -v $PWD:/var/www/html exadra37/php7-fpm:7.1 bash
```

##### on the container shell

```bash
cp -R /usr/local/etc config && \
cd config && \
tar --extract \
    --file=/usr/src/php.tar.xz \
    php-$(php -r "echo PHP_VERSION;")/php.ini-production  \
    --strip-components=1 \
    --transform 's/php.ini-production/php.ini/' && \
exit 0
```

##### on the host shell

```bash
sudo chown -R $USER:$USER config && ls -al config
```
