#!/bin-bash

# One Liner for testing in shell:
#   → if sudo -h > /dev/null 2>&1 ; then echo 'Sudo is enabled.' ; else echo 'Sudo is not enabled' ; fi
function Sudo_Exists()
{
    if sudo -h > /dev/null 2>&1
        then
            return 0 # sudo exists
    fi

    return 1 # sudo doesn't exist
}

function Sudo_Prefix()
{
    local _sudo_prefix=''

    if Sudo_Exists
        then
            local _sudo_prefix='sudo'
    fi

    echo "${_sudo_prefix}"
}
