# WHAT IS IT?

Is a Docker stack to run Php Apps by using Docker Compose Services to wrap the
creation of docker containers from the specified docker images.


## Php Docker Stack Services:

* Http - Nginx, Apache, etc.
* Php - Php-Fpm.
* Database - Perconna, MariaDB, Mysql, etc.
* Cache - Redis, MemCached, etc.
* Logs - Logstash -> ElasticSearch <- Kibana.
* Queue - Beenstalkd, RabbitMQ, ActiveMQ, Apache Kafka, etc.
* Cron Jobs - Just to schedule cron jobs.
* Dev CLI - Access to the container shell.
* Database CLI - Like the awesome mycli propmt for mysql.
* Cache CLI - Like the redis cli.

Each of the above services are provided by Docker Images that are not part of this package.

This means we can choose the image that best suites our needs to attach to each service, via an `.env` file.


## Php Docker Stack goals is to:

* make possible to have a full PHP development stack in any computer, requiring
   only Docker and Docker Compose to be installed, plus their dependencies.
* allow developers without Docker knowledge to use a Docker work-flow for their
   development environment.
* be Docker Image agnostic so that the developer can use any Docker Image or
   extend from the default ones.
* achieve parity between production and development environments in order to
   eliminate the usual `but it works on my machine...`.
* be PHP Framework agnostic.


---

[<< previous](https://gitlab.com/exadra37-docker/php/docker-stack/blob/master/docs/the-package/why_exists.md) | [next >>](https://gitlab.com/exadra37-docker/php/docker-stack/blob/master/docs/the-package/when_to_use_it.md)

[HOME](https://gitlab.com/exadra37-docker/php/docker-stack/blob/master/README.md)

