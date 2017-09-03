# HOW TO INSTALL

Php7 Docker Stack is easy to install in any Php App using composer to manage their dependencies.

A docker version equal or greater than `1.12.0` is required.

To install Docker follow [official documentation](https://docs.docker.com/engine/installation/) and after return here.


## Using Composer

Until we reach version `1.0.0.0` we  must require only as a `dev` dependency.

##### Type in the shell:

```bash
composer require --dev exadra37-docker-compose/php7-docker-stack
```


## Using Git

##### Type in the shell:

```bash
mkdir -p vendor/exadra37-docker-compose && git clone https://gitlab.com/exadra37-docker-compose/php7/docker-stack.git vendor/exadra37-docker-compose/php7-docker-stack
```


## Checking Installation

This is done by using a bash script named `server`, that will alias calls to `docker-compose` command...

##### Type in the shell:

```bash
./vendor/bin/server --help
```

#### Expected output

```bash
Define and run multi-container applications with Docker.

Usage:
  docker-compose [-f <arg>...] [options] [COMMAND] [ARGS...]
  docker-compose -h|--help

Options:
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

[<< previous](./../the-package/why_exists.md) | [next >>](use.md)

[HOME](./../../README.md)
