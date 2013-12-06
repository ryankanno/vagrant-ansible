#!/bin/bash
# Author: Ryan Kanno <ryankanno@localkinegrinds.com>

CONFIG_NAME=.vagrant-ansible-cfg

# Variables that need to be filled
ROLES_ENABLED=""

# Load configuration values
if [[ -e ./$CONFIG_NAME ]]; then source ./$CONFIG_NAME
elif [[ -e ~/$CONFIG_NAME ]]; then source ~/$CONFIG_NAME
elif [[ -e /etc/$CONFIG_NAME ]]; then source /etc/$CONFIG_NAME
fi

if [[ -z $ROLES_ENABLED ]]
then
    echo "Path to enabled roles (ROLES_ENABLED) can't be empty."
    echo ""
    echo "Please check $CONFIG_NAME in the following location(s):"
    echo -e " *  ./$CONFIG_NAME"
    echo -e " *  ~/$CONFIG_NAME"
    echo -e " *  /etc/$CONFIG_NAME"
    exit 1
fi

if [[ $1 == "-h" ]] || [[ $1 == "--help" ]] || [[ "$#" == "0" ]]
then
        echo 'Usage: disrole ROLE'
        echo 'Disables ROLE in vagrant-ansible'
        echo -e '  -h, --help\tDisplays this help'
        echo
        echo 'Roles available to disable:'
        ls -l $ROLES_ENABLED | grep ^l | awk '{ print " * " $9 }'
        exit 0
elif [ -h $ROLES_ENABLED$1 ]
then
        rm $ROLES_ENABLED$1
        echo "Role $1 was successfully disabled"
        exit 0
else
        AVAILABLE_ROLES=`ls -l $ROLES_ENABLED | grep ^l | awk '{ print " * " $9 }'`
        if [[ $1 == "all" ]]
        then
            if [[ -z "$AVAILABLE_ROLES" ]]
            then
                echo "There are no roles in $ROLES_ENABLED to disable."
                exit 0
            else
                while true; do
                    echo "You will disable all the following roles: "
                    echo -e "$AVAILABLE_ROLES\n"
                    read -p "Are you sure you wish to continue? [y, N] " choice
                    case "$choice" in
                        y|Y)
                            rm $ROLES_ENABLED/*
                            echo "All roles were successfully disabled."
                            exit 0;;
                        n|N|"")
                            echo "You selected no. No roles were disabled."
                            exit 0;;
                        *) echo -e "Please answer with y/n.\n";;
                    esac
                done
            fi
        else
            echo -e "Role $1 was not found in $ROLES_ENABLED\n"
            echo "Roles available to disable:"
            echo -e "$AVAILABLE_ROLES"
            exit 1
        fi
fi
