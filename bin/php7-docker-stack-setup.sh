#!/bin/bash

set -e

function createDirIfNotExists()
{
    local dir_path="${1}"

    [ -d "${dir_path}" ] || mkdir -p "${dir_path}"
}

function copyDockerDirToProject()
{
    printf "\n---> Copy Docker Stack Images to Project Root <---"
    cp -rn ./vendor/exadra37-docker-compose/php7-docker-stack/src/docker .
}

function createDefaultHostDirs()
{
    printf "\n---> Create Docker Stack Default Host Dirs <---"

    # creating the default dirs to persist the containers data. otherwise they will
    #  be created as root user.
    createDirIfNotExists ~/.dockerize/storage/database/mysql
    createDirIfNotExists ~/.dockerize/storage/elastic-search/public
    createDirIfNotExists ~/.dockerize/storage/elastic-search/internal
}

function setEnvVars()
{
    printf "\n---> Setup Env Vars <---\n\n"
}

function setupDockerStack()
{
    createDefaultHostDirs
    copyDockerDirToProject
    setEnvVars
}
