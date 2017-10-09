#!/bin/bash

set -e

########################################################################################################################
# Functions
########################################################################################################################

    function Create_Dir_If_Not_Exists()
    {
        local dir_path="${1}"

        [ -d "${dir_path}" ] || mkdir -p "${dir_path}"
    }

    function Copy_Docker_Dir_To_Project_Root()
    {
        printf "\n---> Copy Docker Stack Images to Project Root <---"
        cp -rn ./vendor/exadra37-docker-compose/php7-docker-stack/src/docker .
    }

    function Create_Default_Host_Dirs()
    {
        printf "\n---> Create Docker Stack Default Host Dirs <---"

        # creating the default dirs to persist the containers data. otherwise they will
        #  be created as root user.
        Create_Dir_If_Not_Exists ~/.dockerize/storage/database/mysql
        Create_Dir_If_Not_Exists ~/.dockerize/storage/elastic-search/public
        Create_Dir_If_Not_Exists ~/.dockerize/storage/elastic-search/internal
    }

    function Set_Env_Vars()
    {
        printf "\n---> Setup Env Vars <---\n\n"
    }

    function Setup_Docker_Stack()
    {
        Create_Default_Host_Dirs
        Copy_Docker_Dir_To_Project_Root
        Set_Env_Vars
    }
