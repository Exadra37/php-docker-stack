# HOW TO USE

Any developer with zero experience of Docker can take advantage of Php7 Docker Stack work-flow.

This how to use instructions assumes that the [Install Intructions](install.md) have been followed, including the
[Bash Script Alias](install.md#bash-script-alias) creation.

Users with knowledge of using the `docker-compose` command can take advantage of all is capabilities, once `server` is
only an alias to it.


## FOR PRODUCTION

This is just the basic we need to know to run our App in Production.

### App Up

To have our Php App ready to receive requests we just need to issue a very simple command...

##### Type in Shell:

```bash
server up -d http
```

The above command will bring our app up with the `http` Docker container and all other ones it depends on.

The option `-d` will give us back immediately the shell prompt, as soon as all services are up and running.

This is called to run in detached mode or if you prefer running in the background.


### App Down

This will bring our App off-line and remove all previously created Docker Containers as per defines in the
`docker-compose.yml` services.

##### Type in Shell:

```bash
server down
```

> **ALERT**:
>
>   * This command will stop and destroy all Docker Containers created by `server up http`.
>   * All Docker containers that use volumes to persist data will not loose their data, like the Database one.


## FOR DEVELOPMENT

The examples to run the App in production are also valid for development.

But in development we can and will want to do more stuff...


### App Up

In development we may prefer to see the logs as our App is running and for that we will not go up in detached mode as we
do in production.

##### Type in Shell:

```bash
server up http
```

See we have not used `-d` option here, thus the prompt will not return to our control and will stay attached, allowing
us to see all logs entries from all Docker Containers started with the above command.


### Command Line Interface

To have a terminal using the same Docker Images our App Uses in production plus our development tools we just need a
Docker Container that give us a shell for it.

##### Type in Shell:

```bash
server run dev-cli
```

Now we should inside the Docker Container with a shell that give us access to all our development tools.

To go out of the shell in the container just type `exit`.

---

[<< previous](install.md) | [next >>](./../../CONTRIBUTING.md)

[HOME](./../../README.md)
