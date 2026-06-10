#!/usr/bin/env bash
FILENAME="flow_control_with_if.txt"
if [[ ! -f "${FILENAME}" ]]; then
 touch "${FILENAME}"
fi
