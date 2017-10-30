#!/bin/bash


if [ -f dockergroup.txt ]; then exit 0; fi

DOCKERGROUP=`getent group docker | awk -F: '{printf "%d", $3}'`

echo "$DOCKERGROUP" > dockergroup.txt