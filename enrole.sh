#!/bin/bash
# Author: Ryan Kanno <ryankanno@localkinegrinds.com>

CONFIG_NAME=.vagrant-ansible-cfg

# Variables that need to be filled
ROLES_ENABLED=""
ROLES_AVAILABLE=""

# Define env specific
if [[ -e ./$CONFIG_NAME ]]; then source ./$CONFIG_NAME
elif [[ -e ~/$CONFIG_NAME ]]; then source ~/$CONFIG_NAME
elif [[ -e /etc/$CONFIG_NAME ]]; then source /etc/$CONFIG_NAME
fi

if [[ -z $ROLES_ENABLED ]] || [[ -z $ROLES_AVAILABLE ]]
then
    echo "Path to enabled / available roles (ROLES_ENABLED / ROLES_AVAILABLE) can't be empty."
    echo ""
    echo "Please check $CONFIG_NAME in the following location(s):"
    echo -e " *  ./$CONFIG_NAME"
    echo -e " *  ~/$CONFIG_NAME"
    echo -e " *  /etc/$CONFIG_NAME"
    exit 1
fi

if [[ $1 == "-h" ]] || [[ $1 == "--help" ]] || [[ "$#" == "0" ]]
then
        echo 'Usage: enrole.sh ROLE'
        echo 'Enables ROLE in vagrant-ansible'
        echo -e '  -h, --help\tDisplays this help'
        echo
        echo 'Roles available to enable:'
        ls -l $ROLES_AVAILABLE | grep ^d | awk '{ print " * " $9 }'
        exit 0
elif [ -d $ROLES_AVAILABLE$1 ] && [ ! -h $ROLES_ENABLED$1 ]
then
    rm $ROLES_ENABLED$1 &> /dev/null
    ln -s $ROLES_AVAILABLE$1 $ROLES_ENABLED$1
    echo "Role $1 was successfully enabled"
elif [ -h $ROLES_ENABLED$1 ]
then
        echo "Role $1 is already enabled"
        exit 0
else
        echo -e "Role $1 was not found in $ROLES_AVAILABLE\n"
        echo "Roles available to enable:"
        ls -l $ROLES_AVAILABLE | grep ^d | awk '{ print " * " $9 }'
        exit 1
fi
