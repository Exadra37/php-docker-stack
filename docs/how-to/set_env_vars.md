# ENV VARS

Bash Wrapper Script Env Vars:

    IS_TO_PULL_DOCKER_IMAGES   Set to `false` in `.env` file to disable default behavior.


Docker Compose Env Vars:

    HOST_CODE_DIR               The dir with the code we want to map into the container.
                                Defaults to current dir.

    CONTAINER_CODE_DIR          The dir inside the container where to map with the HOST_CODE_DIR.
                                Defaults to /var/www.

    DATABASE_IMAGE              The docker image to be used for the docker compose service: database.

    DATABASE_IMAGE_BUILD_DIR    The project dir from where to build the custom docker image.
                                Only used if the required DATABASE_IMAGE is missing from the registry.
                                Defaults to ./docker/database/percona/build

    DATABASE_VOLUME_MAP         To define how to map the host dir with the container dir.
                                This allows data to be persisted, even after container has been destroyed.
                                Defaults to ~/.dockerize/services/database/volumes/mysql:/var/lib/mysql

    HTTP_IMAGE                  The docker image to be used for the docker compose service: http.

    HTTP_IMAGE_BUILD_DIR        The project dir from where to build the custom docker image.
                                Only used if the required HTTP_IMAGE is missing from the registry.
                                Defaults to ./docker/http/nginx/build

    HTTP_PORT_MAP               To define the port map between the host and the container.
                                Defaults to 80:80. The php app is available at https://domain.com.
                                With map 8000:80 the php app is available at https://domain.com:8000

    LOGGER_IMAGE                The docker image to be used for the docker compose service: logger.

    LOGGER_IMAGE_BUILD_DIR      The project dir from where to build the custom docker image.
                                Only used if the required LOGGER_IMAGE is missing from the registry.
                                Defaults to ./docker/logger/elasticsearch/build

    LOGGER_VOLUME_MAP           To define how to map the host dir with the container dir.
                                This allows data to be persisted, even after container has been destroyed.
                                Defaults to ~/.dockerize/services/logger/volumes/elasticsearch:/usr/share/elasticsearch/data

    LOGGER_HTTP_PORT_MAP        To define the http port map between the host and the container.
                                Defaults to 9200:9200. The logger is available at https://domain.com:9200.
                                With map 10200:9200 the logger is available at https://domain.com:10200.
