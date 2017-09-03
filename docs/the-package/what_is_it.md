# WHAT IS IT?

Is a Docker stack to run Php7 Apps, using Docker Compose Services like:

* Http - Nginx, Apache, etc.
* Php7 - Php-Fpm.
* Database - Perconna, MariaDB, Mysql, etc.
* Cache - Redis, MemCached, etc.
* Logger - ElasticSearch.
* Queue - Beenstalkd, RabbitMQ, ActiveMQ, Apache Kafka, etc.
* Cron Jobs - Just to schedule cron jobs.
* Dev CLI - Access to the container shell.

Each of the above services are provided by Docker Images that are not part of this package.

This means we can choose the image that best suites our needs to attach to each service, via an `.env` file.


---

[<< previous](why_exists.md) | [next >>](when_to_use_it.md)

[HOME](./../../README.md)

