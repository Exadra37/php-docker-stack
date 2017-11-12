# PHP FPM 7.1

The content of `./7.1/config/default` folder was extracted as per [this instructions](https://gitlab.com/exadra37-docker/php/docker-stack/blob/master/docs/how-to) from the  docker container used by default
for php service in docker compose, that currently is `exadra37/php7-fpm:7.1` that extends the official image `php-fpm:7.1`.

From the shell, inside the running container, we can confirm that the exact php version on time of the extraction was:

```bash
root@b8146544dbf9:/var/www/html# php -v
PHP 7.1.11 (cli) (built: Nov  4 2017 10:24:56) ( NTS )
Copyright (c) 1997-2017 The PHP Group
Zend Engine v3.1.0, Copyright (c) 1998-2017 Zend Technologies
```

> **NOTE**:
>
> * This config is exactly the same of official image therefor is not mapped by default in the docker compose file.
> * Use it as the base to build your custom configuration and then just override the default map from the .env file.
> * In order to maintain parity between production and development environments you should use same configuration across both.
> * For development you may want to enable some settings, thus you must do it from `config/custom/` folder.
>       + enabling xdebug is a good example of using a custom setting.
>       + increasing memory limit is a bad example of using a custom setting.


---

[HOME](https://gitlab.com/exadra37-docker/php/docker-stack/blob/master/README.md)
