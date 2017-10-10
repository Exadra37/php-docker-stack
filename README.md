# Php7 Docker Stack

Docker stack to run Php7 Apps in Production and Development, using Docker Compose Services like:

* Http - Nginx, Apache, etc.
* Php7 - Php-Fpm.
* Database - Perconna, MariaDB, Mysql, etc.
* Cache - Redis, MemCached, etc.
* Logger - ElasticSearch.
* Queue - Beenstalkd, RabbitMQ, ActiveMQ, Apache Kafka, etc.
* Cron Jobs - Just to schedule cron jobs.
* Dev CLI - Access to the container shell.


Php7 Docker Stack goals is to:

* make possible to have a clean Docker Stack to run Php Apps in any environment.
* be Framework agnostic.
* allow developers without Docker knowledge to use a Docker work-flow in their development environment.


> **NOTE:** Until this package achieves version `1.0.0.0` we should only use it for development, afterwards we should
             use it also for production.


## MENU

* **The Package**
    + [Why Exists?](./docs/the-package/why_exists.md)
    + [What Is It?](./docs/the-package/what_is_it.md)
    + [When To use It?](./docs/the-package/when_to_use_it.md)
* **How To**
    + [Install](./docs/how-to/install.md)
    + [Use](./docs/how-to/use.md)
    + [Report an Issue](./docs/how-to/create_an_issue.md)
    + [Create a Branch](./docs/how-to/create_branches.md)
    + [Open a Merge Request](./docs/how-to/create_a_merge_request.md)
    + [Uninstall](./docs/how-to/uninstall.md)
* **Demos**
    + [Laravel 5.5](./docs/demos/laravel-5.5.md)
* **Road Map**
    + [Milestones](https://gitlab.com/exadra37-docker-compose/php7/docker-stack/milestones)
    + [Overview](https://gitlab.com/exadra37-docker-compose/php7/docker-stack/boards)
* **About**
    + [Author](AUTHOR.md)
    + [Contributors](CONTRIBUTORS.md)
    + [Contributing](CONTRIBUTING.md)
    + [License](LICENSE)


## SUPPORT DEVELOPMENT

If this is useful for you, please:

* Share it on [Twitter](https://twitter.com/home?status=Try%20%23Php7DockerStack%20to%20run%20%23PhpApps%20by%20%40Exadra37%20https%3A//gitlab.com/exadra37-docker-compose/php7/docker-stack%20%23php%20%23phpc%20%23phpapp%20%23phpdevelopers%20%23docker%20%23dockercompose%20%23laravel) or in any other channel of your preference.
* Consider to [offer me](https://www.paypal.me/exadra37) a coffee, a beer, a dinner or any other treat 😎.


## EXPLICIT VERSIONING

This repository uses [Explicit Versioning](https://gitlab.com/exadra37-versioning/explicit-versioning) schema.


## BRANCHES

Branches are created as demonstrated [here](docs/how-to/create_branches.md).

This are the type of branches we can see at any moment in the repository:

* `master` - issues and milestones branches will be merge here.
* `last-stable-release` - matches the last stable tag created. Useful for automation tools.
* `issue-4_fix-email-validation` (issue-number_title) - each issue will have is own branch for development.
* `milestone-12_add-cache` (milestone-number_title) - all Milestone issues will start, track and merged here.

Only `master` and `last-stable-release` branches will be permanent ones in the repository and all other ones will be
removed once they are merged.
