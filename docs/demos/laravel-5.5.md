# PHP7 DOCKER STACK DEMO FOR LARAVEL 5.5

Let's see how easy is to start a Laravel 5.5 project with Php Docker Stack.


## Requirements 

### Docker Requirements

To run this demo please ensure that you comply with [this minimal requirements](https://gitlab.com/exadra37-docker/php/docker-stack/blob/master/docs/how-to/install.md#requirements).

> **NOTE:**
>
> → Please note that this demo is aimed for a 100% docker work-flow, thus is not necessary to have installed Php Composer, Apache, Nginx, Mysql or any other dependency than the Docker ones.


### Php Composer Requirements

We will use Composer for Php from a Docker Container with the same Php Version we want to run our Php App.

In order to avoid typing in each php composer command `sudo docker run --rm -it -v $PWD/home/composer/app exadra37/php7-composer:php-7.1`
we just need to follow [this instructions](https://gitlab.com/exadra37-docker-images/php7/composer/blob/latest/docs/how-to/install.md#bash-script-alias) to install
a simple bash script in `~/home/$USER/bin` that will allow us to invoke it using
only `dkcomposer`.

> **NOTE:**
>
> → If you prefer to not install the bash script alias than, just
replace any occurrence of `dkcomposer` by `sudo docker run --rm -it -v $PWD/home/composer/app exadra37/php7-composer:php-7.1`.


## Creates the Laravel Project

Time to use `dkcomposer` to create a Laravel 5.5 project...

##### Type in Shell

```bash
dkcomposer --php 7.1 create-project laravel/laravel:5.5.0 && cd laravel
```

#### The Env File

Please open the `.env` file and comment out the following env vars:

```bash
#DB_HOST=127.0.0.1
#REDIS_HOST=127.0.0.1
#CACHE_DRIVER=file
#SESSION_DRIVER=file
#QUEUE_DRIVER=sync
```

>**NOTE**:
>
> → This is a temporary solution until it is automated from a bash script.

### Installs Dependencies

```bash
dkcomposer --php 7.1 require predis/predis:v1.1.1  elasticsearch/elasticsearch:v5.3.0
```

## Installs Php Docker Stack

Until we reach version `1.0.0.0` we must require only as a `dev` dependency.

##### Type in Shell

```bash
dkcomposer --php 7.1 require --dev exadra37-docker/php-docker-stack:@dev
```

Before we continue please follow [this instructions](https://gitlab.com/exadra37-docker/php/docker-stack/blob/master/docs/how-to/install.md#bash-script-alias) in order to
create a bash alias for your shell.

Now that we have the bash alias `server` for `./vendor/bin/server` let's try
running Laravel on a Php Docker Stack...

> **NOTE:** 
>
> → If you don't want to create the bash alias then just replace all occurrences of `server` by `./vendor/bin/server`.


## Running Laravel


### Server Up

##### Type in Shell:

```bash
server up http
```

### Open In Browser

Now visit the browser on http://localhost:8000 and you should see the Laravel Home page.


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

Visit now the browser on http://localhost:8000/register to create an account.


## Logs

To see a demo of the Docker Log Stack being used in Laravel we need to open the
file `public/index.php` and add some code to it.

### Step 1

#### Look for line:

```php
$response = $kernel->handle(
    $request = Illuminate\Http\Request::capture()
);
```

### Step 2

#### Add after line found in step 1:

```php
/*
|--------------------------------------------------------------------------
| Configure Monolog
|--------------------------------------------------------------------------
*/

use Monolog\Logger;
use Predis\Client as Redis;
use Monolog\Handler\RedisHandler;
use Illuminate\Log\Writer as Log;
use Illuminate\Config\Repository as Config;
use Monolog\Formatter\LogstashFormatter;

$config = $app->make(Config::class);
$monolog = $app->make(Log::class)->getMonolog();

$redis = new Redis([
    'scheme' => 'tcp',
    'host'   => 'cache',
    'port'   => 6379,
]);

$redisHandler = new RedisHandler($redis, 'php_logs');
$formatter = new LogstashFormatter('php-docker-stack', 'server-name', null, 'ctx_', 0);
$redisHandler->setFormatter($formatter);
$monolog->pushHandler($redisHandler);

\Log::info('Server Request', $_SERVER);

/** Ends Monolog Configuration */
```

>**ALERT**:
>
>   → This code is not intended for use in production, just for this demo.


### Step 3

Refresh your current Laravel page with `F5`.


### Step 4

Visit http://localhost:5601.

A login page for Kibana should be visible now.

#### Login Credentials

* user - elastic
* password - changeme

>**ATTENTION**:
>   
> → never use this credentials in production, unless you are asking for trouble.


#### Create Kibana Index

After the login a **Welcome to X-Pack!** page will appear, now to create the
Kibana index we just need to click in the bottom of the page in button **Create**.


#### Viewing the Logs

In the the left pane of the page(the blue one), click in **Discover** and you
should see now the first log created when you have refreshed the Laravel page in
step 3.

>**NOTE**:
>  
> → This is a Kibana community version, thus free to use, but once it includes X-Pack it requires to [subscribe](https://www.elastic.co/subscriptions) a free plan for continuous usage.


---

[HOME](https://gitlab.com/exadra37-docker/php/docker-stack/blob/master/README.md)
