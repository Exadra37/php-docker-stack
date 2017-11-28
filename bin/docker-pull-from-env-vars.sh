#!/bin/bash

set -e

########################################################################################################################
# Sourcing
########################################################################################################################

    script_dir="${PWD}/vendor/exadra37-docker/php-docker-stack/bin"
    source "${script_dir}/sudo-exists.sh"
    source "${script_dir}/parse-env-var.sh"


########################################################################################################################
# Functions
########################################################################################################################

    # Docker Pull will always exit with 0 code, once when the images don't exist we will ger
    function Docker_Pull()
    {
        local _docker_image="${1?}"
        local _sudo_prefix="$(Sudo_Prefix)"

        "${_sudo_prefix}" docker pull "${_docker_image}" || true # docker pull always exit with 0
    }

    function Pull_Docker_Image_From_Env_File()
    {
        local _env_var="${1?}"
        local _env_file="${2?}"

        if [ -f ".env" ]
            then

                local _docker_image="$(Parse_Env_Var_From_Env_File "${_env_var}" "${_env_file}")"

                if [ -z "${_docker_image}" ]
                    then
                        return 1
                fi

                printf "\n---> Pulling From Env File : ${_docker_image}\n"
                Docker_Pull "${_docker_image}"
        fi

        return 0
    }

    function Pull_Docker_Image_From_Docker_Compose()
    {
        local _env_var="${1?}"
        local _docker_compose_file="${2?}"
        local _docker_image="$(Parse_Env_Var_From_Docker_Compose "${_env_var}" "${_docker_compose_file}")"

        if [ -z "${_docker_image}" ]
            then
                return 1
        fi

        printf "\n---> Pulling From Docker Compose : ${_docker_image}\n"
        Docker_Pull "${_docker_image}"

        return 0
    }

    function Pull_Docker_Image_From_Env_Var()
    {
        local _env_var="${1?}"
        local _env_file="${2?}"
        local _docker_compose_file="${3?}"

        if ! Pull_Docker_Image_From_Env_File "${_env_var}" "${_env_file}"
            then
                Pull_Docker_Image_From_Docker_Compose "${_env_var}" "${_docker_compose_file}"
        fi

        return 0
    }

    function Pull_Docker_Images_From_Env_Vars()
    {
        local _env_var
        local -a _docker_images_env_vars

        IFS=',' read -a _docker_images_env_vars <<< "${1?}"
        local _env_file="${2?}"
        local _docker_compose_file="${3?}"

        for _env_var in "${_docker_images_env_vars[@]}"
            do
                Pull_Docker_Image_From_Env_Var "${_env_var}" "${_env_file}" "${_docker_compose_file}"
        done

        # add an empty line for layout purposes
        echo

        return 0
    }
