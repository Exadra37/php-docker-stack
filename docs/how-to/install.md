# HOW TO INSTALL

Php Docker Stack is easy to install in any Php App using composer to manage their dependencies.


## Requirements

* A docker version equal or greater than 1.12.0. To install Docker please
   [follow this instructions](https://docs.docker.com/engine/installation/).
* Docker Composer in a version equal or greater than `2.1`. To install Docker
   Compose please [follow this instructions](https://docs.docker.com/compose/install/).


## Using Composer

Until we reach version `1.0.0.0` we  must require only as a `dev` dependency and we need to add to our `composer.json` this line `"minimum-stability": "dev"`.

##### Type in the shell:

```bash
composer require --dev exadra37-docker/php-docker-stack
```


## Using Git

##### Type in the shell:

```bash
mkdir -p vendor/exadra37-docker && git clone https://gitlab.com/exadra37-docker/php/docker-stack.git vendor/exadra37-docker/php-docker-stack && ln -s ./../exadra37-docker/php-docker-stack/bin/server ./vendor/bin/server
```


## Checking Installation

This is done by using a bash script named `server`, that will alias calls to `docker-compose` command...

##### Type in the shell:

```bash
./vendor/bin/server --help
```

#### Expected output

```bash
PHP7 DOCKER STACK

This is a wrapper bash script for `docker-compose` command to run a Docker Stack
for any Php App.


Usage:

    server [wrapper-options] [docker-compose usage here...]

... # stripping remaining output

```

If we see the above output or similar we are in the right track.


## Bash Script Alias

To make even more easy to use the bash script to call `docker-compose` for us, we may prefer to just type `server --help`
instead of `./vendor/bin/server --help`.

### For ZSH Shell

##### Type in the shell:

```bash
echo "alias server=./vendor/bin/server" >> ~/.zshrc && . ~/.zshrc
```

### For Bash Shell

##### Type in the shell:

```bash
echo "alias server=./vendor/bin/server" >> ~/.bashrc && . ~/.bashrc
```

The alias should be now working...

##### Type in the shell:

```bash
server --help
```

We should now see the same output from when we run `./vendor/bin/server --help`.


---

[<< previous](https://gitlab.com/exadra37-docker/php/docker-stack/blob/master/docs/the-package/why_exists.md) | [next >>](https://gitlab.com/exadra37-docker/php/docker-stack/blob/master/docs/how-to/use.md)

[HOME](https://gitlab.com/exadra37-docker/php/docker-stack/blob/master/README.md)
