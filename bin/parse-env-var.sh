#!/bin/bash

set -e

function Parse_Env_Var_From_Env_File()
{
    local env_var="${1?}"

    local env_file="${2?}"

    # TODO: only grep lines that are not commented out.
    local env_var_line="$(grep -i "${env_var}=" "${env_file}")"

    # PHP_IMAGE=exadra37/php7-fpm:latest -> exadra37/php7-fpm:latest
    local docker_image="${env_var_line##*=}"

    echo "${docker_image}"
}

function Parse_Env_Var_From_Docker_Compose()
{
    local env_var="${1?}"

    local docker_compose_file="${2?}"

    local env_var_line="$(grep -i "${env_var}:-" "${docker_compose_file}")"

    # image: ${PHP_IMAGE:-exadra37/php7-fpm:latest} -> exadra37/php7-fpm:latest
    local docker_image="${env_var_line##*:-}"

    # removes } from end of string
    local docker_image="${docker_image::-1}"

    echo "${docker_image}"
}
