# HOW TO INSTALL

Php Docker Stack is easy to install in any Php App using composer to manage their dependencies.


## Requirements

* A docker version equal or greater than 1.12.0. To install Docker please
   [follow this instructions](https://docs.docker.com/engine/installation/).
* Docker Composer in a version equal or greater than `2.1`. To install Docker
   Compose please [follow this instructions](https://docs.docker.com/compose/install/).
* By default Elasticsearch is being used as part of the log stack, thus we need to set the `vm.max_map_count` in our host:

    + For current session:

        ```bash
        sudo sysctl -w vm.max_map_count=262144
        ```
    + To persist after reboot

        ```bash
        sudo sh -c "echo vm.max_map_count=262144 > /etc/sysctl.d/99-max_map_count.conf"
        ```

> NOTE:
>
> → Above shell commands need to run with root priveleges.  
> → Depending on your sytem you may need or not to use `sudo` to obtain root privileges.


## Using Composer

Until we reach version `1.0.0.0` we  must require only as a `dev` dependency.

### From Docker Container

In order to avoid typing in each composer command `sudo docker run --rm -it -v $PWD/home/composer/app exadra37/php7-composer:php-7.1`
we just need to follow [this instructions](https://gitlab.com/exadra37-docker-images/php7/composer/blob/latest/docs/how-to/install.md#bash-script-alias) to install
a simple bash script in `~/home/$USER/bin` that will allow us to invoke it using
only `dkcomposer`.

> **NOTE:** 
>
> → If you prefer to not install the bash script alias than, just replace any occurrence of `dkcomposer` by `sudo docker run --rm -it -v $PWD/home/composer/app exadra37/php7-composer:php-7.1`.

##### Type in Shell

```bash
dkcomposer --php 7.1 require --dev exadra37-docker/php-docker-stack:@dev
```

### Advantages of using composer from Docker Container instead from Localhost:

* guarantees we run composer in the same Php version used by our Php App.
* packages that are sensitive to the Php version are installed in the correct version.


## Using Git

##### Type in the shell:

```bash
mkdir -p vendor/{exadra37-docker,bin} && git clone https://gitlab.com/exadra37-docker/php/docker-stack.git vendor/exadra37-docker/php-docker-stack && ln -s ./../exadra37-docker/php-docker-stack/bin/server ./vendor/bin/server
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
