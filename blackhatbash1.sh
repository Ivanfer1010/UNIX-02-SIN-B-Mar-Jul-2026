#!/usr/bin/env bash
set -x
bash --version

env

echo ${SHELL}

echo ${RANDOM}

echo ${OSTYPE}

ps -e -f

ps -ef

df --human-readable

#!/bin/bash -x        #Activate Bash's debugging mode.

#bash -r blackhatbash1.sh  #Try running your script using Bash's Restricted Mode

#bash -n blackhatbash1.sh   #It is used to verify the script syntax.

#bash -x blackhatbash1.sh    #Execute the script


set +x