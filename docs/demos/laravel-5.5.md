# PHP7 DOCKER STACK DEMO FOR LARAVEL 5.5

Let's see how easy is to start a Laravel 5.5 project with Php7 Docker Stack.

Required to run this demo:

* A docker version equal or greater than 1.12.0.
* Docker Composer in a version equal or greater than `2.1`.

> **NOTE:** Please note that this demo is aimed for a 100% docker work-flow,
thus is not necessary to have installed Apache, Nginx, Mysql or any other
dependency than the Docker ones.


## Create the Laravel Project

Let's install first Laravel 5.5 by using a docker composer image for php7.

In order to avoid type in each composer command `sudo docker run --rm -it -v $PWD/home/composer/app exadra37/php7-composer:php-7.0`
we just need to follow [this instructions](https://gitlab.com/exadra37-docker-images/php7/composer/blob/latest/docs/how-to/install.md#bash-script-alias) to install
a simple bash script in `~/home/$USER/bin` that will allow us to invoke it using
only `dkcompoer`.

> **NOTE:** If you prefer to not install the bash script alias than, just
replace any occurrence of `dkcomposer` by `sudo docker run --rm -it -v $PWD/home/composer/app exadra37/php7-composer:php-7.0`.


##### Type in Shell

```bash
dkcomposer --php 7.0 create-project laravel/laravel:5.5.0 && cd laravel
```

```bash
dkcomposer --php 7.0 require predis/predis:v1.1.1  elasticsearch/elasticsearch:v5.3.0
```

## Install Php7 Docker Stack

Requiring Php7 Docker Stack as a dev dependency...

##### Type in Shell

```bash
dkcomposer --php 7.0 require --dev exadra37-docker-compose/php7-docker-stack
```

Before we continue please follow [this instructions](./../how-to-bash-script-alias) in order to
create a bash alias for you shell.

Now that we have the bash alias `server` for `./vendor/bin/server` let's try
running Laravel on a Php7 Docker Stack...

> **NOTE:** If you prefer to not create the bash alis then just replace all
occurrences of `server` by `./vendor/bin/server`.


## Running Laravel


### The Env File

Before we run Laravel we need to prepare some environment variables...

Open `.env` file in you text editor...

#### Env vars to update:

* `DB_HOST=127.0.0.1` to `DB_HOST=database`
* `CACHE_DRIVER=file` to `CACHE_DRIVER=redis`
* `SESSION_DRIVER=file` to `SESSION_DRIVER=redis`
* `QUEUE_DRIVER=sync` to `QUEUE_DRIVER=beanstalkd`
* `REDIS_HOST=127.0.0.1` to `REDIS_HOST=cache`

#### Env vars to add:

* `HTTP_PORT_MAP=8888:80`


### Server Upl

##### Type in Shell:

```bash
server up http
```

### Visit Browser

Now visit the browser on http://localhost:8888 and you should see the Laravel Home page.


### Enable Authentication

To enable authentication we need to run some Artisan commands and for that we need a Shell inside the Docker Container.


##### Type in Shell:

```bash
server run dev-cli
```

Now we should be in a shell inside the Docker Container, where we will run 2 Artisan commands...

##### Type in Container Shell:

```bash
php artisan make:auth
```

##### The Output:

```bash
Authentication scaffolding generated successfully.
```

##### Type in Container Shell:

```bash
php artisan migrate
```

##### The Output:

```bash
Migration table created successfully.
Migrating: 2014_10_12_000000_create_users_table
Migrated:  2014_10_12_000000_create_users_table
Migrating: 2014_10_12_100000_create_password_resets_table
Migrated:  2014_10_12_100000_create_password_resets_table
```

Visit now the browser on http://localhost:8888/register to create an account.


