#!/usr/bin/env bash
# All this script does is create a directory, create a file
# within the directory, and then list the contents of the directory.
set -x
mkdir mydirectory
touch mydirectory/myfile
ls -l mydirectory
set +x

#bash -n blackhatbash2.sh

#bash -x blackhatbash2.sh
#+ set -x
#+ mkdir mydirectory
#mkdir: cannot create directory ‘mydirectory’: El fichero ya existe
#+ touch mydirectory/myfile
#+ ls -l mydirectory
#total 0
#-rw-rw-rw- 1 root root 0 jun  1 13:25 myfile
#+ set +x

#bash blackhatbash2.sh
#+ mkdir mydirectory
#mkdir: cannot create directory ‘mydirectory’: El fichero ya existe
#+ touch mydirectory/myfile
#+ ls -l mydirectory
#total 0
#-rw-rw-rw- 1 root root 0 jun  1 13:27 myfile
#+ set +x

