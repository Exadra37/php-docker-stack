#!/bin/bash

set -e

########################################################################################################################
# Functions
########################################################################################################################

    function Create_Dir_If_Not_Exists()
    {
        local _dir_path="${1}"

        if [ -n "${_dir_path}" ] && [ ! -d "${_dir_path}" ]
            then
                printf "\nCreated Dir: ${_dir_path}"

                mkdir -p "${_dir_path}"

                # add an empty line for layout purposes
                echo
        fi
    }

    function Copy_Docker_Dir_To_Project_Root()
    {
        printf "\n---> Copy Docker Stack Images to Project Root <---"
        cp -rn ./vendor/exadra37-docker-compose/php7-docker-stack/src/docker .
    }

    function Create_Default_Host_Dirs_From_Env_Vars()
    {
        local _env_var
        local -a _env_vars

        IFS=',' read -a _env_vars <<< "${1?}"
        local _env_file="${2?}"
        local _docker_compose_file="${3?}"

        printf "\n---> Create Docker Stack Default Host Dirs <---"

        for _env_var in "${_env_vars[@]}"
            do
                Create_Dir_If_Not_Exists "$(Parse_Left_Env_Var_Value_From_Env_File "${_env_var}" "${_env_file}")"

                Create_Dir_If_Not_Exists "$(Parse_Left_Env_Var_Value_From_Docker_Compose "${_env_var}" "${_docker_compose_file}")"
        done

        # add an empty line for layout purposes
        echo

        return 0
    }

    function Set_Env_Vars()
    {
        printf "\n---> Setup Env Vars <---\n\n"

        printf "\nDB_HOST=database" >> .env
        printf "\nCACHE_DRIVER=redis" >> .env
        printf "\nSESSION_DRIVER=redis" >> .env
        printf "\nQUEUE_DRIVER=beanstalkd" >> .env
        printf "\nREDIS_HOST=cache" >> .env
        printf "\nHTTP_PORT_MAP=8000:80" >> .env
    }

    function Setup_Docker_Stack()
    {
        local _host_dir_env_vars="${1?}"
        local _env_file="${2?}"
        local _docker_compose_file="${3?}"

        Create_Default_Host_Dirs_From_Env_Vars "${_host_dir_env_vars}" "${_env_file}" "${_docker_compose_file}"
        Copy_Docker_Dir_To_Project_Root
        Set_Env_Vars
    }
