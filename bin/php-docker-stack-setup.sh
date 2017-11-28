#!/bin/bash

set -e

########################################################################################################################
# Functions
########################################################################################################################

    function Create_Dir_If_Not_Exists()
    {
        # ~/some/dir becomes /home/username/some/dir
        local _dir_path="${1/~\//$HOME/}"

        if [ -n "${_dir_path}" ] && [ ! -d "${_dir_path}" ]
            then
                printf "\nCreated Dir: ${_dir_path}"

                # TODO: "~" is not recognized as referencing the user home dir
                mkdir -p "${_dir_path}"

                # add an empty line for layout purposes
                echo
        fi
    }

    function Copy_Docker_Dir_To_Project_Root()
    {
        printf "\n---> COPY DOCKER STACK IMAGES TO PROJECT ROOT"
        cp -rn ./vendor/exadra37-docker/php-docker-stack/src/docker .

        # add an empty line for layout purposes
        echo
    }

    function Create_Default_Host_Dirs_From_Env_Vars()
    {
        local _env_var
        local -a _env_vars

        IFS=',' read -a _env_vars <<< "${1?}"
        local _env_file="${2?}"
        local _docker_compose_file="${3?}"

        printf "\n---> CREATE DOCKER STACK DEFAULT HOST DIRS"

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
        local _env_file="${1?}"
        local _project_identifier="${2?}"

        printf "\n---> SETUP ENVIRONMENT VARIABLES IN ENV FILE\n"

        # TODO:
        #   → add only the missing env vars.
        #   → don't update existing vars
        if grep -q "START - Created by Php Docker Stack" "${_env_file}"
            then
                return # we already have inserted the env vars
        fi

        printf "\n# START - Created by Php Docker Stack" >> "${_env_file}"
        printf "\n# Edits will not be overridden..." >> "${_env_file}"
        printf "\nDB_HOST=database" >> "${_env_file}"
        printf "\nCACHE_DRIVER=redis" >> "${_env_file}"
        printf "\nSESSION_DRIVER=redis" >> "${_env_file}"
        printf "\nQUEUE_DRIVER=beanstalkd" >> "${_env_file}"
        printf "\nREDIS_HOST=cache" >> "${_env_file}"
        printf "\nDATABASE_VOLUME_MAP=~/.php-docker-stack/${_project_identifier}/services/database/volumes/mysql:/var/lib/mysql" >> "${_env_file}"

        # TODO: Only map to port 8000 if no service listening on port 80.
        printf "\nHTTP_PORT_MAP=8000:80" >> "${_env_file}"

        printf "\n# END - Created by Php Docker Stack\n" >> "${_env_file}"

        # add an empty line for layout purposes
        echo
    }

    function Setup_Docker_Stack()
    {
        local _host_dir_env_vars="${1?}"
        local _env_file="${2?}"
        local _docker_compose_file="${3?}"
        local _project_identifier="${4?}"

        Create_Default_Host_Dirs_From_Env_Vars "${_host_dir_env_vars}" "${_env_file}" "${_docker_compose_file}"
        Copy_Docker_Dir_To_Project_Root
        Set_Env_Vars "${_env_file}" "${_project_identifier}"
    }
