#!/usr/bin/env bash

set -x
let result="4 * 5"
echo ${result}

result1=$((5 * 5))
echo ${result1}

result=$(expr 5 + 505)
echo ${result}
set +x
