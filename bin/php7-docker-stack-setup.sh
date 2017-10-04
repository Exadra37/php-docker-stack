#!/bin/bash

function createDirIfNotExists()
{
    local dir_path="${1}"

    [ -d "${dir_path}" ] || mkdir -p "${dir_path}"
}

function copyDockerDirToProject()
{
    [ -d "./docker" ] || cp -rn ./vendor/exadra37-docker-compose/php7-docker-stack/src/docker .
}

# creating the default dirs to persist the containers data. otherwise they will
#  be created as root user.
createDirIfNotExists ~/.dockerize/storage/database/mysql
createDirIfNotExists ~/.dockerize/storage/elastic-search/public
createDirIfNotExists ~/.dockerize/storage/elastic-search/internal

copyDockerDirToProject
