#!/usr/bin/env bash
NOMBRE=$1
APELLIDO=$2

date +"%d-%m-%Y" > output.txt

echo "$NOMBRE $APELLIDO" >> output.txt

cp output.txt backup.txt

cat output.txt