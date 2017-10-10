#!/bin/bash

set -e

function Parse_Env_Var_From_Env_File()
{
    local _env_var="${1?}"

    local _env_file="${2?}"

    # TODO: only grep lines that are not commented out.
    local _env_var_line="$(grep -i "${_env_var}=" "${_env_file}")"

    # PHP_IMAGE=exadra37/php7-fpm:latest -> exadra37/php7-fpm:latest
    local _env_var_default_value="${_env_var_line##*=}"

    echo "${_env_var_default_value}"
}

function Parse_Env_Var_From_Docker_Compose()
{
    local _env_var="${1?}"

    local _docker_compose_file="${2?}"

    local _env_var_line="$(grep -i "${_env_var}:-" "${_docker_compose_file}")"

    # image: ${PHP_IMAGE:-exadra37/php7-fpm:latest} -> exadra37/php7-fpm:latest
    local _env_var_default_value="${_env_var_line##*:-}"

    # removes } from end of string
    local _env_var_default_value="${_env_var_default_value::-1}"

    echo "${_env_var_default_value}"
}

function Parse_Left_Env_Var_Value_From_Env_File()
{
    local _env_var="${1?}"

    local _env_file="${2?}"

    local _env_var_value="$(Parse_Env_Var_From_Env_File "${_env_var}" "${_env_file}")"

    echo "${_env_var_value%:*}"
}

function Parse_Left_Env_Var_Value_From_Docker_Compose()
{
    local _env_var="${1?}"

    local _docker_compose_file="${2?}"

    local _env_var_value="$(Parse_Env_Var_From_Docker_Compose "${_env_var}" "${_docker_compose_file}")"

    echo "${_env_var_value%:*}"
}

function Parse_Right_Env_Var_Value_From_Env_File()
{
    local _env_var="${1?}"

    local _env_file="${2?}"

    local _env_var_value="$(Parse_Env_Var_From_Env_File "${_env_var}" "${_env_file}")"

    echo "${_env_var_value#*:}"
}

function Parse_Right_Env_Var_Value_From_Docker_Compose()
{
    local _env_var="${1?}"

    local _docker_compose_file="${2?}"

    local _env_var_value="$(Parse_Env_Var_From_Docker_Compose "${_env_var}" "${_docker_compose_file}")"

    echo "${_env_var_value#*:}"
}
