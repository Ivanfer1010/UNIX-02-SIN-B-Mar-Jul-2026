#!/usr/bin/env bash
USER_INPUT="${0}"
if [[ -z "${USER_INPUT}" ]]; then  #-z null
 echo "You must provide an argument!"
 exit 1
fi
if [[ -f "${USER_INPUT}" ]]; then    #-f  file 
 echo "${USER_INPUT} is a file."
elif [[ -d "${USER_INPUT}" ]]; then    #-d directory
 echo "${USER_INPUT} is a directory."
else
echo "${USER_INPUT} is not a file or a directory."
fi