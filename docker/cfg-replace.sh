#!/bin/sh

PARAM_HOST=$1
PARAM_PORT=$2
IN_FILE=$3

cat $IN_FILE \
| sed -e "s/\${TURBINE_HOST}/$PARAM_HOST/g" \
| sed -e "s/\${TURBINE_PORT}/$PARAM_PORT/g" 

