# PHP 7 DEVELOPMENT CLI

From docker compose we load by default 2 custom configuration files:

* `./php/conf.d/zzz-custom.ini` - add additional ini settings for development, like enabling php to display errors.
* `./php-fpm.d/zzz-custom.conf` - add additional configuration settings for php-fpm.

>**NOTE:**
>
> * In order to maintain parity between production and development environments be very careful with what settings you add/override.
>       + increasing memory limit is an a bad example of add/override a setting once is breaking the parity between environments.
>       + enabling php to display errors is a good example of add/override a setting.
> * Any custom setting added here will only take effect when running command line scripts or running tests inside the `dev-cli` container.
> * To add/override settings on `php` container you must do so on `./docker/php/php7-fpm//build/{PHP_VERSION}/config`.


---

[HOME](https://gitlab.com/exadra37-docker/php/docker-stack/blob/master/README.md)
