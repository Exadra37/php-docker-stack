#!/bin/bash

set -e

function pull_Docker_Image_From_Env_File()
{
    local env_var="${1}"

    if [ -f ".env" ]
        then
            # TODO: only grep lines that are not commented out.
            local env_var_line=$(grep -i ${env_var}= .env)

            # PHP_IMAGE=exadra37/php7-fpm:latest -> exadra37/php7-fpm:latest
            local docker_image=${env_var_line##*=}

            if [ -z "${docker_image}" ]
                then
                    return 1
            fi

            printf "\n---> Pulling From Env File : ${docker_image}\n"
            sudo docker pull "${docker_image}"

            return 0
    fi
}

function pull_Docker_Image_From_Docker_Compose()
{
    local env_var="${1}"
    local env_var_line=$(grep -i ${env_var}:- ./vendor/exadra37-docker-compose/php7-docker-stack/src/docker-compose.yml)

    # image: ${PHP_IMAGE:-exadra37/php7-fpm:latest} -> exadra37/php7-fpm:latest
    local docker_image=${env_var_line##*:-}

    # removes } from end of string
    local docker_image=${docker_image::-1}

    if [ -z "${docker_image}" ]
        then
            return 1
    fi

    printf "\n---> Pulling From Docker Compose : ${docker_image}\n"
    sudo docker pull "${docker_image}"

    return 0
}

function pull_Docker_Images()
{
    local DOCKER_IMAGES_ENV_VARS=(
        CACHE_IMAGE
        CRON_JOBS_IMAGE
        DATABASE_IMAGE
        HTTP_IMAGE
        PHP_IMAGE
        QUEUE_IMAGE
        DEV_CLI_IMAGE
        DATABASE_CLI_IMAGE
    )

    for env_var in "${DOCKER_IMAGES_ENV_VARS[@]}"
        do
            if ! pull_Docker_Image_From_Env_File "${env_var}"
                then
                    pull_Docker_Image_From_Docker_Compose "${env_var}"
            fi
    done
}

# printf "\nPull Docker Images\n"

#pull_Docker_Images
